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
    var connection: NWConnection?
    var queue = DispatchQueue.global(qos: .userInitiated)
    /// New data will be place in this variable to be received by observers
    @Published private(set) public var messageReceived: Data?
    /// When there is an active listening NWConnection this will be `true`
    @Published private(set) public var isReady: Bool = false
    /// Default value `true`, this will become false if the UDPListener ceases listening for any reason
    @Published public var listening: Bool = true
    @Published public var port: String
    @Published public var actualMessage: String = ""
    
    /// A convenience init using Int instead of NWEndpoint.Port
    convenience init(on port: Int) {
        self.init(on: NWEndpoint.Port(integerLiteral: NWEndpoint.Port.IntegerLiteralType(port)))
    }
    /// Use this init or the one that takes an Int to start the listener
    init(on port: NWEndpoint.Port) {
        self.port = port.debugDescription
        let params = NWParameters.udp
        params.allowFastOpen = true
        self.listener = try? NWListener(using: params, on: port)
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
            self.createConnection(connection: connection)
        }
        self.listener?.start(queue: self.queue)
    }
    
    func createConnection(connection: NWConnection) {
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
            
            guard let elem = Endpoint.initCase(string: String(stringArray.first ?? "")) else {
                print("405 method not found")
                return
            }
            // ping, store, find_node, find_value
            print("stringArray" + stringArray.description)
            print("Data: " + stringData)
            self.actualMessage = stringData
            
            switch stringArray.first ?? "" {
            case "ping": print("ping chi ling")
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
    
    func send(endpoint: Endpoint) {
        let connection = NWConnection(host: "127.0.0.1", port: NWEndpoint.Port("1337") ?? NWEndpoint.Port.any, using: .udp)
        print("connection: \(connection.endpoint.debugDescription)")
        
        connection.send(content: endpoint.commands.data(using: .utf8), completion: NWConnection.SendCompletion.contentProcessed(({ (NWError) in
            if (NWError == nil) {
                print("Data was sent to UDP destination ")
                
            } else {
                print("ERROR! Error when data (Type: Data) sending. NWError: \n \(NWError!)")
            }
        })))
    }
    func cancel() {
        self.listening = false
        self.connection?.cancel()
    }
}
