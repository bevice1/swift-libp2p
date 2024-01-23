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
            guard let message = try? Message.Dial(contiguousBytes: Array<UInt8>(req.payload.readableBytesView)) else {
                return .close
            }
            handleDialRequest(req: req, msg: message)
            return .respondThenClose(payload)
            
        default: print("default case")
            return .close
        }
        
    case .outbound:
        let dial = requestDial(req: req)
        return .respond(dial!)
    default:
        print("default")
        return .close
        
    }
    return .close
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
