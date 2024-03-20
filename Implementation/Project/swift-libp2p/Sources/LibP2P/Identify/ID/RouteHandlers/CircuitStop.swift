//
//  File.swift
//  
//
//  Created by Benedikt Kaiser on 06.02.24.
//

import Foundation
internal func handleCircuitStopRequest(_ req: Request) -> Response<ByteBuffer> {
    switch req.streamDirection {
    case .inbound:
        switch req.event {
        case .ready:
            print("ready")
        case .data(let byteBuffer):
            if let message = try? StopMessage(contiguousBytes: Array<UInt8>(req.payload.readableBytesView)) {
                if(message.type == .connect) {
                    let request = handleStopRequest(req: req, stopMessage: message)
                    if let request = request {
                        return .respond(request)
                    } else {
                        return .close
                    }
                }
            }
        case .closed:
            print("closed")
        case .error(let error):
            print("error: \(error)")
        }
        return .close
        
    case .outbound:
        switch req.event {
        case .ready:
            if let response = stopConnect(req: req) {
                return .respond(response)
            } else {
                return .close
            }
        case .data(let byteBuffer):
            print("data")
        case .closed:
            print("closed")
        case .error(let error):
            print("error: \(error)")
        }
        return .close
    }
}

func stopConnect(req: Request ) -> ByteBuffer? {
    if let manager = req.application.identify as? Identify {
        return manager.handleOutboundStopRequest()
    }
    return nil
}
func handleStopRequest(req: Request, stopMessage: StopMessage) -> ByteBuffer? {
    guard let manager = req.application.identify as? Identify else {
        req.logger.error("Identify::Unknown IdentityManager. Unable to contruct stop message")
        return nil
    }
    
    let elem = manager.handleStopRequest(peer: stopMessage.peer)
        return elem
    
}
