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
            print("data")
        case .closed:
            print("closed")
        case .error(let error):
            print("error: \(error)")
        }
        return .close
        
    case .outbound:
        switch req.event {
        case .ready:
            print("ready")
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
