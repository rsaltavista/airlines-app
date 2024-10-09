//
//  Flight+FlightCellModel.swift
//  Airlines
//
//  Created by Ricardo Altavista on 09/10/24.
//

import Foundation
extension Flight {
    var asCellModel: FlightCell.Model {
        FlightCell.Model(
            departureAirportText: departureAirport,
            arrivalAirportText: arrivalAirport,
            statusText: status.rawValue,
            statusCompletionText: completionStatus.rawValue,
            departureTimeText: departureTime,
            arrivalTimeText: arrivalTime
        )
    }
}
