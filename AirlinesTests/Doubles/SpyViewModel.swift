//
//  SpyViewModel.swift
//  AirlinesTests
//
//  Created by Ricardo Altavista on 11/10/24.
//

@testable import Airlines
final class SpyViewModel: FlightViewModelProtocol {
    
    var loadFlightsCalled = false
    var numberOfFlightsCalled = false
    var flightInfoCalled = false
    var flightInfoIndexCalled: Int?
    var setFilterCalled = false
    var setFilterOptionCalled: FilterOption?
    
    func loadFlights(completion: @escaping (Result<Void, any Error>) -> Void) {
        loadFlightsCalled = true
        completion(.success(()))
    }
    
    func numberOfFlights() -> Int {
        numberOfFlightsCalled = true
        return 1
    }
    
    func flightInfo(at index: Int) -> Flight {
        flightInfoCalled = true
        flightInfoIndexCalled = index
        return Flight(
            flightId: "1",
            status: .arrived,
            completionStatus: .onTime,
            startDate: "2024-08-27",
            endDate: "2024-08-28",
            departureTime: "10:00",
            arrivalTime: "12:00",
            departureAirport: "GRU",
            arrivalAirport: "JFK",
            airplaneName: "Boeing 737"
        )
    }
    
    func setFilter(_ filterOption: FilterOption, completion: @escaping () -> Void) {
        setFilterCalled = true
        setFilterOptionCalled = filterOption
        completion()
    }
    
}
