//
//  File.swift
//  
//
//  Created by Benedikt Kaiser on 06.02.24.
//

import Foundation

public final class Relay: CustomStringConvertible {
    
    weak var application: Application?
    var localPeerID: PeerID
    private var logger: Logger
    
    private let el: EventLoop
    
    public enum Errors: Error {
        case timedOut
    }
    public struct Multicodecs {
        static let PING = "/ipfs/ping/1.0.0"
        static let DELTA = "/p2p/id/delta/1.0.0"
        static let PUSH = "/ipfs/id/push/1.0.0"
        static let ID = "/ipfs/id/1.0.0"
        static let AUTONAT = "/ipfs/autonat/1.0.0"
        //        static let AUTONAT = "/libp2p/autonat/v1.0.0"
    }
    
    public var description: String {
        return "Relay circuit"
    }
    
    public init(application: Application) {
        self.application = application
        self.localPeerID = application.peerID
        self.logger = application.logger
        self.el = application.eventLoopGroup.next()
        
        /// Register our protocol route handler on the application...
        try! routes(application)
        
        self.logger[metadataKey: "Identify"] = .string("\(UUID().uuidString.prefix(5))")
        
        /// Register our event listeners
//        application.events.on(self, event: .upgraded(self.onNewConnection))
//        application.events.on(self, event: .disconnected(self.onDisconnected))
        
        self.logger.trace("Initialized!")
    }
}
