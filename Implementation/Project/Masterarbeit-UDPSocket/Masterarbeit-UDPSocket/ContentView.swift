//
//  ContentView.swift
//  MasterarbeitUDPSocket
//
//  Created by Benedikt Kaiser on 17.05.23.
//

import SwiftUI
//TODO: jetztt muss eine udp nachricht geschickt werden
struct ContentView: View {
    @State var server: UDPListener?
    @State var selectedPort: String = "1337"
    @State var selectedRequest: Endpoint = .ping
    var body: some View {
        VStack {
            
            Text("UDP Endpoint tests")
                .bold()
                .font(.title)
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading) {
                    
                HStack {
                    Text("Select a port to listen to: ")
                    TextField("Port", text: $selectedPort)
                        .keyboardType(.numberPad)
                        .frame(width: 50)
                    Button("start") {
                        server = UDPListener(on: Int(selectedPort) ?? 1337)
                    }
                }
                Text("Server is listening on port: \(server?.port ?? "NaN")")
                }
                HStack {
                    Picker("Available Endpoints", selection: $selectedRequest) {
                        ForEach(Endpoint.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    Button("send") {
                        server?.send(endpoint: selectedRequest)
                    }
                }
            }
            
            Text(server?.actualMessage ?? "no message")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
