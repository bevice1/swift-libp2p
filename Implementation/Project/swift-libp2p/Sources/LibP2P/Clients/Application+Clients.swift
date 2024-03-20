//
//  Application+Clients.swift
//  
//
//  Created by Brandon Toms on 5/1/22.
//

import LibP2PCore

extension Application {
    public var clients: Clients {
        .init(application: self)
    }

    public struct Clients {
        public struct Provider {
            let run: (Application) -> ()

            public init(_ run: @escaping (Application) -> ()) {
                self.run = run
            }
        }
        
        final class Storage {
            var clients:[String:((Application) -> Client)] = [:]
            init() { }
        }
        
        struct Key: StorageKey {
            typealias Value = Storage
        }

        func initialize() {
            self.application.storage[Key.self] = .init()
        }
        
        public func client(for client:Client.Type) -> Client? {
            self.client(forKey: client.key)
        }
        
        public func client(forKey key:String) -> Client? {
            self.storage.clients[key]?(self.application)
        }
        
        public func use(_ provider: Provider) {
            provider.run(self.application)
        }

        public func use(key: String, _ client: @escaping (Application) -> (Client)) {
            self.storage.clients[key] = client
        }

        public let application: Application
        
        public var available:[String] {
            self.storage.clients.keys.map { $0 }
        }
        
        var storage: Storage {
            guard let storage = self.application.storage[Key.self] else {
                fatalError("Clients not initialized. Initialize with app.clients.initialize()")
            }
            return storage
        }
        
        public func dump() {
            print("*** Installed Clients ***")
            print(self.storage.clients.keys.map { $0 }.joined(separator: "\n"))
            print("----------------------------------")
        }
    }
}

public enum HandlerConfig {
    /// Searches the registered routes and uses the existing pipeline configuration if one exists
    case inherit
    /// Allows you to specify your own child channel pipeline configuration for this particular stream
    case rawHandlers([ChannelHandler])
    
    case handlers([Application.ChildChannelHandlers.Provider])
    
    internal func handlers(application:Application, connection:Connection, forProtocol proto:String) -> [ChannelHandler] {
        switch self {
        case .rawHandlers(let handlers):
            return handlers
        case .handlers(let initializers):
            return initializers.reduce(into: Array<ChannelHandler>(), { partialResult, provider in
                partialResult.append(contentsOf: provider.run(connection))
            })
        case .inherit:
            return application.responder.current.pipelineConfig(for: proto, on: connection) ?? []
        }
    }
}


public enum MiddlewareConfig {
    case inherit
    case custom(Middleware?)
}
