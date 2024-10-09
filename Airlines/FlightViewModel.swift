//
//  FlightViewModel.swift
//  Airlines
//
//  Created by Ricardo Altavista on 09/10/24.
//

import Foundation


protocol FlightViewModelProtocol {
    var flights: [Flight] {get}
    var onFlightsUpdated: (() -> Void)? {get set}
    func loadFlights()
    func numberOfFlights() -> Int
    func flightInfo(at index: Int) -> FlightCell.Model
}

class FlightViewModel: FlightViewModelProtocol {
    private(set) var flights: [Flight] = []
    var onFlightsUpdated: (() -> Void)?
    
    func loadFlights() {
        guard let url = Bundle.main.url(forResource: "massa-de-teste", withExtension: "json") else {
            print("Error: File massa-de-teste.json not found.")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let flightsResponse = try decoder.decode(FlightsResponse.self, from: data)
            self.flights = flightsResponse.flights
            onFlightsUpdated?()
        }
        catch {
            print("Error trying to load data.\(error)")
        }
    }
    
    func numberOfFlights() -> Int {
        return flights.count
    }
    
    func flightInfo(at index: Int) -> FlightCell.Model {
        let flight = flights[index]
        return FlightCell.Model(
            departureAirportText: flight.departureAirport,
            arrivalAirportText: flight.arrivalAirport,
            statusText: flight.status.rawValue,
            statusCompletionText: flight.completionStatus.rawValue,
            departureTimeText: flight.departureTime,
            arrivalTimeText: flight.arrivalTime
        )
    }
}
