//
//  Application+Peerstore.swift
//  
//
//  Created by Brandon Toms on 5/1/22.
//

import LibP2PCore

extension Application {
    public var peerstore: PeerStores {
        .init(application: self)
    }

    public var peers: PeerStore {
        guard let manager = self.peerstore.storage.manager else {
            fatalError("No Peerstore configured. Configure with app.peerstore.use(...)")
        }
        return manager
    }
    
    public struct PeerStores {
        public struct Provider {
            let run: (Application) -> ()

            public init(_ run: @escaping (Application) -> ()) {
                self.run = run
            }
        }

        final class Storage {
            var manager: PeerStore?
            init() { }
        }

        struct Key: StorageKey {
            typealias Value = Storage
        }

        func initialize() {
            self.application.storage[Key.self] = .init()
        }

        public func use(_ provider: Provider) {
            provider.run(self.application)
        }

        public func use(_ makeManager: @escaping (Application) -> (PeerStore)) {
            self.storage.manager = makeManager(self.application)
        }

        let application: Application

        var storage: Storage {
            guard let storage = self.application.storage[Key.self] else {
                fatalError("Peerstore not initialized. Configure with app.peerstore.initialize()")
            }
            return storage
        }
    }
}
