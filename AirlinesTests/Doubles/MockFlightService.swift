//
//  FlightsPresenterSpy.swift
//  AirlinesTests
//
//  Created by Ricardo Altavista on 11/10/24.
//

@testable import Airlines
import Foundation

final class MockFlightService: FlightServiceProtocol {
    var flightsToReturn: [Flight] = []
    var shouldReturnError = false

    func loadFlights(completion: @escaping (Result<[Flight], Error>) -> Void) {
        if shouldReturnError {
            completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
        } else {
            completion(.success(flightsToReturn))
        }
    }
}


