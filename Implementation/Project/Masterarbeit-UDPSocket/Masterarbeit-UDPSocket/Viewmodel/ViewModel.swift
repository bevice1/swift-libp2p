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
    @Published var selectedPort = "" {
        didSet {
            canStart = !(self.selectedPort.range(of: "^[0-9]{1,4}$", options: .regularExpression) == nil)
        }
    }
    @Published var selectedRequest: Endpoint = .ping
    let host = "127.0.0.1"
    @Published var selectedConnectPort = "" {
        didSet {
            canConnect = !(self.selectedConnectPort.range(of: "^[0-9]{1,4}$", options: .regularExpression) == nil)
        }
    }
    @Published var actualMessage = ""
    @Published var listening: Bool = false {
        didSet {
            if self.listening == true {
                connectionString = "Server is listening"
            }
        }
    }
    @Published var canConnect = false
    @Published var canStart = false
    @Published var connectionString = "Server is not listening"
    
    init() {
        BGTaskScheduler.shared.register(forTaskWithIdentifier: "kaiser.b.private.udpSocketRefresh", using: nil) { task in
            print("registering refresh task")
            self.handleRefreshTask(task: task as! BGAppRefreshTask)
        }
        udpListener.registerReceiver(didReceive: { elem in
            print("elem:::::::\(elem)")
            self.actualMessage = elem
        }) 
    }
    
    func setupSocket() {
       listening = udpListener.setupSocket(port: Int(selectedPort) ?? 1337)
    }
    
    func startConnectionAndSend() {
        udpListener.createConnection(host: host, port: selectedConnectPort)
        udpListener.customSend(selectedRequest.commands.data(using: .utf8)!)
    }
    
    
    func handleRefreshTask(task: BGAppRefreshTask) {
        // Schedule a new refresh task.
           scheduleAppRefresh()

        print("handles refresh task")

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
       let request = BGAppRefreshTaskRequest(identifier: "kaiser.b.private.udpSocketRefresh")
       // Fetch no earlier than 15 minutes from now.
        
//       request.earliestBeginDate = Date(timeIntervalSinceNow: 1*60 )
        print("background task scheduled")
        
        
       do {
          try BGTaskScheduler.shared.submit(request)
       } catch {
          print("Could not schedule app refresh: \(error)")
       }
    }
    
    
    
}
