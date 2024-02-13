//
//  File.swift
//
//
//  Created by Benedikt Kaiser on 06.02.24.
//

import Foundation

internal func handleCircuitHopRequest(_ req: Request) -> Response<ByteBuffer> {
    
    switch req.streamDirection {
    case .inbound:
        switch req.event {
        case .ready: return .stayOpen
        case .data(let payload):
            if let message = try? HopMessage(contiguousBytes: Array<UInt8>(req.payload.readableBytesView)) {
                if message.type == HopMessage.TypeEnum.reserve {
                    let request = handleHopRequest(req: req, hopMessage: message)
                    if let request = request {
                        return .respond(request)
                    } else {
                        return .close
                    }
                } else if message.type == HopMessage.TypeEnum.status {
                    print("hop reservation response received")
                } else {
                    return .close
                }
            } else {
                return .close
            }
        default:
            print("default")
            return .close
        }
        
    case .outbound:
        switch req.event {
        case .ready:
            let data = initiateHopRequest(req: req)
            guard let data = data else {
                print("ERROR sending hop init")
                return .close
            }
            return .respond(data)
        case .data(let byteBuffer):
            if let message = try? HopMessage(contiguousBytes: Array<UInt8>(req.payload.readableBytesView)) {
                if message.type == HopMessage.TypeEnum.status {
                    print("status received")
                    return .stayOpen
                }
                if message.type == .reserve {
                    print("reserve sending")
                    return .stayOpen
                }
            } else {
                
            return .close
            }
        default:
            return .close
        }
    }
    return .close
}

func initiateHopRequest(req: Request) -> ByteBuffer? {
    guard let manager = req.application.identify as? Identify else {
        req.logger.error("Identify::Unknown IdentityManager. Unable to contruct ping message")
        return nil
    }
    if let peerinfo = manager.application?.peerInfo {
        let elem = manager.initiateHopMessage(addresses: peerinfo)
        return elem
    } else {
        return nil
    }
}

func handleHopRequest(req: Request, hopMessage: HopMessage) -> ByteBuffer? {
    guard let manager = req.application.identify as? Identify else {
        req.logger.error("Identify::Unknown IdentityManager. Unable to contruct ping message")
        return nil
    }
    if let peerinfo = manager.application?.peerInfo {
        let elem = manager.handleHopRequest(addresses: peerinfo)
        return elem
    } else {
        return nil
    }
}
