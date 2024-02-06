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
        return .close
        
    case .outbound:
        return .close
    }
}
