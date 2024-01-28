//
//  File.swift
//
//
//  Created by Benedikt Kaiser on 06.01.24.
//

import Foundation
internal func handleAutonatRequest(_ req:Request) -> Response<ByteBuffer> {
    
    switch req.streamDirection {
    case .inbound:
        
        switch req.event {
        case .ready:
            return .stayOpen
        case .data(let payload):
            if let message = try? Message.Dial(contiguousBytes: Array<UInt8>(req.payload.readableBytesView)) {
                let request = handleDialRequest(req: req, msg: message)
                if let request = request {
                    return .respondThenClose(request)
                } else {
                    return .close
                }
            }
            
            if let message = try? Message.DialResponse(contiguousBytes: Array<UInt8>(req.payload.readableBytesView)) {
                handleDialResponse(req: req, msg: message)
                return .close
            }
            
            return .close
            
        default: print("default case")
            return .close
        }
        
    case .outbound:
        switch req.event {
        case .ready:
            if let message = try? Message.Dial(contiguousBytes: Array<UInt8>(req.payload.readableBytesView)) {
                let dial = requestDial(req: req)
                return .respond(dial!)
            }
        case .data(let payload):
            if let message = try? Message.DialResponse(contiguousBytes: Array<UInt8>(req.payload.readableBytesView)) {
                handleDialResponse(req: req, msg: message)
            }
            return .close
        default: print("default outbound called")
            return .close
        }
        return .close
    }
}

func requestDial(req: Request) -> ByteBuffer? {
    guard let manager = req.application.identify as? Identify else {
        req.logger.error("Identify::Unknown IdentityManager. Unable to contruct ping message")
        return nil
    }
    
    if let peerinfo = manager.application?.peerInfo {
        let elem = manager.handleOutboundAutonatDial(addresses: peerinfo)
        return elem
    } else {
        return nil
    }
}

func handleDialRequest(req: Request, msg: Message.Dial) -> ByteBuffer? {
    guard let manager = req.application.identify as? Identify else {
        req.logger.error("Identify::Unknown IdentityManager. Unable to contruct ping message")
        return nil
    }
    return manager.handleDialRequest(msg: msg)
}
func handleDialResponse(req: Request, msg: Message.DialResponse) {
    if let manager = req.application.identify as? Identify {
        switch msg.status {
        case .ok:
            manager.application?.autonatResult(isReachable: true)
        case .eDialError, .eDialRefused, .eBadRequest, .eInternalError:
            manager.application?.autonatResult(isReachable: false)
        }
    }
}
