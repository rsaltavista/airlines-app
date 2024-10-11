//
//  FlightService.swift
//  Airlines
//
//  Created by Ricardo Altavista on 09/10/24.
//

import Foundation

protocol FlightServiceProtocol{
    func loadFlights(completion: @escaping (Result<[Flight], Error>) -> Void)
}

final class FlightService: FlightServiceProtocol {
    func loadFlights(completion: @escaping (Result<[Flight], Error>) -> Void) {
        guard let url = Bundle.main.url(forResource: "massa-de-teste", withExtension: "json") else{
            print("Error: File massa-de-teste not found.")
            return
        }
        do{
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let flightsResponse = try decoder.decode(FlightsResponse.self, from: data)
            completion(.success(flightsResponse.flights))
        }
        catch let error {
            completion(.failure(error))
        }
    }
}
