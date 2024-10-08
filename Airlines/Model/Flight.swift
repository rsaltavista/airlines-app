//
//  Flight.swift
//  Airlines
//
//  Created by Ricardo Altavista on 07/10/24.
//

import Foundation
struct Flight: Decodable {
    let flightId: String
    let status: Status
    let completionStatus: CompletionStatus
    let startDate: String
    let endDate: String
    let departureTime: String
    let arrivalTime: String
    let departureAirport: String
    let arrivalAirport: String
    let airplaneName: String
    
    enum Status: String, Decodable {
        case arrived = "CONCLUIDO"
        case canceled = "CANCELADO"
    }
    
    enum CompletionStatus: String, Decodable {
        case delayed = "ATRASOU"
        case onTime = "NO_HORARIO"
        case canceled = "CANCELADO"
    }
}


