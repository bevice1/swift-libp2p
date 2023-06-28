//
//  ViewModel.swift
//  Masterarbeit-UDPSocket
//
//  Created by Benedikt Kaiser on 28.06.23.
//

import Foundation
import BackgroundTasks

class ViewModel: ObservableObject {
    var udpListener =  UDPListener()
    let operationQueue = OperationQueue()
    @Published var selectedPort = ""
    @Published var selectedRequest: Endpoint = .ping
    let host = "127.0.0.1"
    @Published var selectedConnectPort = ""
    @Published var actualMessage = ""
    @Published var listening: Bool = false
    
    init() {
        BGTaskScheduler.shared.register(forTaskWithIdentifier: "kaiser.b.private.Masterarbeit-UDPSocket.udpSocketRefresh", using: nil) { task in
            self.handleRefreshTask(task: task as! BGAppRefreshTask)
        }
        udpListener.registerReceiver(didReceive: { elem in
            self.actualMessage = elem
        }) 
    }
    
    func setupSocket() {
       listening = udpListener.setupSocket(port: Int(selectedPort) ?? 1337)
    }
    
    func startConnection() {
        udpListener.createConnection(host: host, port: selectedConnectPort)
    }
    
    func send() {
        udpListener.customSend(selectedRequest.commands.data(using: .utf8)!)
    }
    
    
    
    
    func handleRefreshTask(task: BGAppRefreshTask) {
        // Schedule a new refresh task.
           scheduleAppRefresh()


           // Create an operation that performs the main part of the background task.
           let operation = RefreshAppContentsOperation()


           // Provide the background task with an expiration handler that cancels the operation.
           task.expirationHandler = {
              operation.cancel()
           }


           // Inform the system that the background task is complete
           // when the operation completes.
           operation.completionBlock = {
              task.setTaskCompleted(success: !operation.isCancelled)
           }


           // Start the operation.
           operationQueue.addOperation(operation)

    }
    func scheduleAppRefresh() {
       let request = BGAppRefreshTaskRequest(identifier: "com.example.apple-samplecode.ColorFeed.refresh")
       // Fetch no earlier than 15 minutes from now.
       request.earliestBeginDate = Date(timeIntervalSinceNow: 2 * 60)
            
       do {
          try BGTaskScheduler.shared.submit(request)
       } catch {
          print("Could not schedule app refresh: \(error)")
       }
    }
    
    
    
}
