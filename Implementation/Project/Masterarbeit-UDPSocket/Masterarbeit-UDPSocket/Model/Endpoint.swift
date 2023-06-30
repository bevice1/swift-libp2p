//
//  Endpoint.swift
//  Masterarbeit-UDPSocket
//
//  Created by Benedikt Kaiser on 18.06.23.
//

import Foundation

enum Endpoint: String, CustomStringConvertible, CaseIterable {
    case ping = "ping"
    case find_node = "find_node"
    case find_value = "find_value"
    case store = "store"
    
    var description: String {
        switch self {
        case .find_node: return "/find_node"
        case .find_value: return "/find_value"
        case .ping: return "/ping"
        case .store: return "/store"
        }
    }
    
    var commands: String {
        switch self {
        case .find_node: return "node not found"
        case .find_value: return "value not found"
        case .ping: return "node pinged"
        case .store: return "entry stored"
        }
    }
    
    
    
    
        static func initCase(string: String) -> Endpoint? {
            switch string {
            case "find_node":  return .find_node
            case "ping": return .ping
            case "find_value": return .find_value
            case "store": return .store
            default: return nil
            }
        }
        
    }
