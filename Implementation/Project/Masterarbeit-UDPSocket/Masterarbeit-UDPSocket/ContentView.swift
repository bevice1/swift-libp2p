//
//  ContentView.swift
//  MasterarbeitUDPSocket
//
//  Created by Benedikt Kaiser on 17.05.23.
//

import SwiftUI
import BackgroundTasks
//TODO: jetztt muss eine udp nachricht geschickt werden
struct ContentView: View {
    @ObservedObject var vm = ViewModel()
    
    var body: some View {
        VStack {
            
            Text("UDP Endpoint tests")
                .bold()
                .font(.title)
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading) {
                    
                HStack {
                    Text("Select a port to listen to: ")
                    TextField("Port", text: $vm.selectedPort)
                        .keyboardType(.numberPad)
                        .frame(width: 50)
                    Button("start") {
                        vm.setupSocket()
                    }
                }
                    Text("Server is listening").foregroundColor(vm.listening ? Color.green : Color.red)
                }
                HStack {
                    Picker("Available Endpoints", selection: $vm.selectedRequest) {
                        ForEach(Endpoint.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    TextField("Port", text: $vm.selectedConnectPort)
                        .keyboardType(.numberPad)
                        .frame(width: 50)
                    Button("connect") {
                        vm.startConnection()
                    }
                    Button("send") {
                        vm.send()
                    }
                }
            }
            
            Section("Message") {
                
                Text(vm.actualMessage)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
