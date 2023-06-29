//
//  UDPListener.swift
//  Masterarbeit-UDPSocket
//
//  Created by Benedikt Kaiser on 22.05.23.
//
// nc -u 127.0.0.1 1337 < /tmp/findNode  

import Foundation
import Network
import Combine

class UDPListener: ObservableObject {
    let availableEndpoints: Endpoint = .ping
    var listener: NWListener?
    @Published var connection: NWConnection?
    var queue = DispatchQueue.global(qos: .userInitiated)
    /// New data will be place in this variable to be received by observers
    @Published private(set) public var messageReceived: Data?
    /// When there is an active listening NWConnection this will be `true`
    @Published private(set) public var isReady: Bool = false
    /// Default value `true`, this will become false if the UDPListener ceases listening for any reason
    @Published public var listening: Bool = true
    @Published public var actualMessage: String = "nothing received yet"
    var didReceive: ((String) -> Void)?

    
    func registerReceiver(didReceive: @escaping (String) -> Void) {
        self.didReceive = didReceive
    }


    func setupSocket(on port: NWEndpoint.Port) -> Bool {
        let params = NWParameters.udp
        params.allowFastOpen = true
        do {
            self.listener = try NWListener(using: params, on: port)
        } catch {
            return false
        }
        self.listener?.stateUpdateHandler = { update in
            switch update {
            case .ready:
                self.isReady = true
                print("Listener connected to port \(port)")
            case .failed, .cancelled:
                // Announce we are no longer able to listen
                self.listening = false
                self.isReady = false
                print("Listener disconnected from port \(port)")
            default:
                print("Listener connecting to port \(port)...")
            }
        }
        self.listener?.newConnectionHandler = { connection in
            print("Listener receiving new message")
            self.acceptConnection(connection: connection)
        }
        self.listener?.start(queue: self.queue)
        return true
    }
    
    func setupSocket(port: Int) -> Bool {
       return setupSocket(on: NWEndpoint.Port(integerLiteral: NWEndpoint.Port.IntegerLiteralType(port)))
    }
    
    
    func acceptConnection(connection: NWConnection) {
        self.connection = connection
        self.connection?.stateUpdateHandler = { (newState) in
            switch (newState) {
            case .ready:
                print("Listener ready to receive message - \(connection)")
                self.receive()
            case .cancelled, .failed:
                print("Listener failed to receive message - \(connection)")
                // Cancel the listener, something went wrong
                self.listener?.cancel()
                // Announce we are no longer able to listen
                self.listening = false
            default:
                print("Listener waiting to receive message - \(connection)")
            }
        }
        self.connection?.start(queue: .global())
    }

    func receive() {
        self.connection?.receiveMessage { data, context, isComplete, error in
            if let unwrappedError = error {
                print("Error: NWError received in \(#function) - \(unwrappedError)")
                return
            }
            guard isComplete, let data = data else {
                print("Error: Received nil Data with context - \(String(describing: context))")
                return
            }
            self.messageReceived = data
            var stringData = String(data: data, encoding: .utf8) ?? ""
            stringData = stringData.replacingOccurrences(of: "\n", with: "")
            let stringArray = stringData.split(separator: "/")
            guard !stringArray.isEmpty else {
                print("400 string array empty")
                return
            }
            
            guard Endpoint.initCase(string: String(stringArray.first ?? "")) != nil else {
                print("405 method not found")
                return
            }
            // ping, store, find_node, find_value
            print("stringArray" + stringArray.description)
            print("Data: " + stringData)
            self.actualMessage = stringData
            guard let didReceive = self.didReceive else {
             return
            }
            didReceive(self.actualMessage)
            
            switch stringArray.first ?? "" {
            case "ping": print("ping chi ling")
                self.customSend("node \(self.listener?.port?.debugDescription ?? "") alive".data(using: .utf8)!)
            case "store": print("storr storr")
            case "find_node":
                if stringArray.count < 2 {
                    print("418 i am a teapot")
                    return
                }
                print("found node: " + stringArray[1])
            case "find_value" :
                if stringArray.count < 2 {
                    print("418 i am a teapot")
                    return
                }
                print("found value: " + stringArray[1])
            default:
                print("ERROR")
                
            }
            if self.listening {
                self.receive()
            }
        }
    }
    
    func cancel() {
        self.listening = false
        self.connection?.cancel()
    }
    
    func customSend(_ payload: Data) {
            connection!.send(content: payload, completion: .contentProcessed({ sendError in
                if let error = sendError {
                    NSLog("Unable to process and send the data: \(error)")
                } else {
                    NSLog("Data has been sent")
                    self.connection!.receiveMessage { (data, context, isComplete, error) in
                        guard let myData = data else { return }
                        NSLog("Received message: " + String(decoding: myData, as: UTF8.self))
                        self.actualMessage = String(decoding: myData, as: UTF8.self)
                        guard let didReceive = self.didReceive else {
                         return
                        }
                        didReceive(String(decoding: myData, as: UTF8.self))
                    }
                }
            }))
        }
        
    func createConnection(host: String, port: String) {
        connection = NWConnection(host: NWEndpoint.Host(host), port: NWEndpoint.Port(port)!, using: .udp)
            connection!.stateUpdateHandler = { (newState) in
                switch (newState) {
                case .preparing:
                    NSLog("Entered state: preparing")
                case .ready:
                    NSLog("Entered state: ready")
                case .setup:
                    NSLog("Entered state: setup")
                case .cancelled:
                    NSLog("Entered state: cancelled")
                case .waiting:
                    NSLog("Entered state: waiting")
                case .failed:
                    NSLog("Entered state: failed")
                default:
                    NSLog("Entered an unknown state")
                }
            }
            
            connection!.viabilityUpdateHandler = { (isViable) in
                if (isViable) {
                    NSLog("Connection is viable")
                } else {
                    NSLog("Connection is not viable")
                }
            }
            
            connection!.betterPathUpdateHandler = { (betterPathAvailable) in
                if (betterPathAvailable) {
                    NSLog("A better path is availble")
                } else {
                    NSLog("No better path is available")
                }
            }
            
            connection!.start(queue: .global())
        }
}
