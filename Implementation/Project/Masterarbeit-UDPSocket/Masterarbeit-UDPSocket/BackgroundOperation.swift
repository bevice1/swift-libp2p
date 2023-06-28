//
//  BackgroundOperation.swift
//  Masterarbeit-UDPSocket
//
//  Created by Benedikt Kaiser on 25.06.23.
//

import Foundation

class RefreshAppContentsOperation: Operation {
    override func main() {
        if isCancelled {
            return
        }
        
        startUDPSocket()
        
        if isCancelled {
            stopUDPSocket()
            return
        }
    }
    
    
    func startUDPSocket() {
        
    }
    
    func stopUDPSocket() {
        
    }
}

