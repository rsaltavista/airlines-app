//
//  FlightViewModel.swift
//  Airlines
//
//  Created by Ricardo Altavista on 09/10/24.
//

import Foundation

protocol FlightViewModelProtocol {
    func loadFlights(completion: @escaping (Result<Void, Error>) -> Void)
    func numberOfFlights() -> Int
    func flightInfo(at index: Int) -> Flight
    func setFilter(_ filterOption: FilterOption, completion: @escaping () -> Void)
}

final class FlightViewModel: FlightViewModelProtocol {
    
    private var flights: [Flight] = []
    private var filteredFlights: [Flight] = []
    private let flightService: FlightServiceProtocol
    
    private var currentDate: Date = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        // Definig a previous date to validate filters
        return dateFormatter.date(from: "2024-08-27 10:00") ?? Date()
    }()
    
    init(flightService: FlightServiceProtocol) {
        self.flightService = flightService
    }
    
    func loadFlights(completion: @escaping (Result<Void, Error>) -> Void) {
        flightService.loadFlights { [weak self] result in
            switch result {
            case .success(let flights):
                self?.flights = flights
                self?.filteredFlights = flights
                completion(.success(()))
            case .failure(let failure):
                completion(.failure(failure))
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
    
    func setFilter(_ filterOption: FilterOption, completion: @escaping () -> Void) {
        switch filterOption {
        case .all:
            filteredFlights = flights
        case .concluded:
            filteredFlights = flights.filter { $0.status == .arrived}
        case .cancelled:
            filteredFlights = flights.filter { $0.status == .canceled}
        case .onSchedule:
            filteredFlights = flights.filter { isFlightOnSchedule($0) }
        case .onTravel:
            filteredFlights = flights.filter { isFlightInProgress($0)}
        }
        completion()
    }
    
    private func isFlightOnSchedule(_ flight: Flight) -> Bool {
        guard let flightStartDate = createDate(from: flight.startDate, time: flight.departureTime) else {
            return false
        }
        return flightStartDate >= currentDate
    }
    
    private func isFlightInProgress(_ flight: Flight) -> Bool {
        guard let startDate = createDate(from: flight.startDate, time: flight.departureTime),
              let endDate = createDate(from: flight.endDate, time: flight.arrivalTime) else {
            return false
        }
        return startDate <= currentDate && endDate >= currentDate
    }
    
    private func createDate(from date: String, time: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        return dateFormatter.date(from: "\(date) \(time)")
    }
}
