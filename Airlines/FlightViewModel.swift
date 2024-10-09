//
//  FlightViewModel.swift
//  Airlines
//
//  Created by Ricardo Altavista on 09/10/24.
//

import Foundation

protocol FlightViewModelProtocol {
    func loadFlights(completion: @escaping () -> Void)
    func numberOfFlights() -> Int
    func flightInfo(at index: Int) -> Flight
}

final class FlightViewModel: FlightViewModelProtocol {
    private var flights: [Flight] = []
    private let flightService: FlightServiceProtocol
    
    init(flightService: FlightServiceProtocol) {
        self.flightService = flightService
    }
    
    func loadFlights(completion: @escaping () -> Void) {
        flightService.loadFlights { [weak self] result in
            switch result {
            case .success(let flights):
                self?.flights = flights
                completion()
            case .failure(let failure):
                print("Error loading flights - \(failure)")
            }
        }
    }
    
    func numberOfFlights() -> Int {
        return flights.count
    }
    
    func flightInfo(at index: Int) -> Flight {
        return flights[index]
    }
}
