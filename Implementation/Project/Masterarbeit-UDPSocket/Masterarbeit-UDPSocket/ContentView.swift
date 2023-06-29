//
//  ContentView.swift
//  MasterarbeitUDPSocket
//
//  Created by Benedikt Kaiser on 17.05.23.
//

import SwiftUI
import BackgroundTasks
struct ContentView: View {
    @ObservedObject var vm = ViewModel()
    @Environment(\.scenePhase) var scenePhase

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
                    .disabled(!vm.canStart)
                }
                    Text(vm.connectionString).foregroundColor(vm.listening ? Color.green : Color.red)
                }
                HStack {
     
                    TextField("Port", text: $vm.selectedConnectPort)
                        .keyboardType(.numberPad)
                        .frame(width: 50)
                    Picker("Available Endpoints", selection: $vm.selectedRequest) {
                        ForEach(Endpoint.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    Button("connect & send") {
                        vm.startConnectionAndSend()
                    }
                    .disabled(!vm.canConnect)
                }
            }
            
            Section("Message") {
                
                Text(vm.actualMessage)
            }
        }
        .padding()
        .onChange(of: scenePhase) { newValue in
            if newValue == .background {
                vm.scheduleAppRefresh()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
