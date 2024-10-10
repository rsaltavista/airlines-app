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
    func setFilter(_ filterOption: FilterOption)
}

final class FlightViewModel: FlightViewModelProtocol {
    private var flights: [Flight] = []
    private var filteredFlights: [Flight] = []
    private let flightService: FlightServiceProtocol
    
    init(flightService: FlightServiceProtocol) {
        self.flightService = flightService
    }
    
    func loadFlights(completion: @escaping () -> Void) {
        flightService.loadFlights { [weak self] result in
            switch result {
            case .success(let flights):
                self?.flights = flights
                self?.filteredFlights = flights
                completion()
            case .failure(let failure):
                print("Error loading flights - \(failure)")
            }
        }
    }
    
    func numberOfFlights() -> Int {
        return filteredFlights.count
    }
    
    func flightInfo(at index: Int) -> Flight {
        return filteredFlights[index]
    }
    
    func setFilter(_ filterOption: FilterOption) {
        switch filterOption {
        case .all:
            filteredFlights = flights
        case .concluded:
            filteredFlights = flights.filter { $0.status == .arrived}
        case .cancelled:
            filteredFlights = flights.filter { $0.status == .canceled}
        case .onSchedule:
            filteredFlights = flights.filter { $0.startDate >= DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .none)}
        case .onTravel:
            filteredFlights = flights.filter { $0.startDate <= DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .none)}
        }
    }
}
