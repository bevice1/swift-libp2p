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
        print("got connection inbound")
        return .close
        
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
            print("data")
        case .closed:
            print("closed")
        case .error(let error):
            print("error")
        }
        return .close
    }
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
