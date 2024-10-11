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
            statusText: formattedStatus,
            departureTimeText: departureTime,
            arrivalTimeText: arrivalTime,
            startDate: formattedStartDate,
            isConcluded: status == Status.arrived,
            isCanceled: status == Status.canceled
        )
    }
    
    private var formattedStatus: String {
        switch status {
        case .arrived:
            return "Concluído"
        case .canceled:
            return "Cancelado"
        }
    }
    
    private var formattedStartDate: String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd/MM/yyyy"
        
        if let date = inputFormatter.date(from: startDate){
            return outputFormatter.string(from: date)
        } else {
            return startDate
        }
    }
}
