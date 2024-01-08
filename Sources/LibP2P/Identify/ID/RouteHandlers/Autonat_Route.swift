//
//  File.swift
//  
//
//  Created by Benedikt Kaiser on 06.01.24.
//

import Foundation
internal func handleAutonatRequest(_ req:Request) -> Response<ByteBuffer> {
// schau bei IPFS_ID_PUSH 
    
    
    switch req.streamDirection {
    case .inbound:
        
        switch req.event {
        case .data(let payload):
            guard let manager = req.application.identify as? Message else {
                return .close
            }
            
        default: print("default case")
            return .close
        }
        
    case .outbound:
        
        return .close
        print("outbound")
    default:
        print("default")
        return .close
        
    }
    return .close
}
