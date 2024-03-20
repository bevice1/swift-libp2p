//
//  LibReservation.swift
//  LibP2PChatExample
//
//  Created by Benedikt Kaiser on 03.03.24.
//

import Foundation
import Multiaddr

class Reservations: ObservableObject, ReservationDelegate {
    public private(set) var p2pService: LibP2PService!
    
    func onReservation(received: Multiaddr) {
        print("reservationReceived")
    }
}
