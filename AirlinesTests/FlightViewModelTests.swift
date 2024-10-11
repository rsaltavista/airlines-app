//
//  FlightViewModelTests.swift
//  AirlinesTests
//
//  Created by Ricardo Altavista on 11/10/24.
//

import XCTest
@testable import Airlines

final class FlightViewModelTests: XCTestCase {

    var viewModel: FlightViewModel!
    var mockFlightService: MockFlightService!

    override func setUp() {
        super.setUp()
        mockFlightService = MockFlightService()
        viewModel = FlightViewModel(flightService: mockFlightService)
    }

    override func tearDown() {
        viewModel = nil
        mockFlightService = nil
        super.tearDown()
    }

    // Testando carregamento de voos com sucesso
    func testLoadFlightsSuccess() {
        let expectedFlights = [
            Flight(
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
        ]
        mockFlightService.flightsToReturn = expectedFlights

        let expectation = self.expectation(description: "Load flights")
        viewModel.loadFlights { _ in
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)

        XCTAssertEqual(viewModel.numberOfFlights(), expectedFlights.count)
        XCTAssertEqual(viewModel.flightInfo(at: 0).flightId, expectedFlights[0].flightId)
    }

    func testLoadFlightsFailure() {
        mockFlightService.shouldReturnError = true
        
        let expectation = self.expectation(description: "Load flights")
        viewModel.loadFlights { _ in
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(viewModel.numberOfFlights(), 0)
    }

    // Testando filtro de voos concluídos
    func testFilterConcludedFlights() {
        let expectedFlights = [
            Flight(
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
            ),
            Flight(
                flightId: "2",
                status: .canceled,
                completionStatus: .canceled,
                startDate: "2024-08-27",
                endDate: "2024-08-28",
                departureTime: "10:00",
                arrivalTime: "12:00",
                departureAirport: "LAX",
                arrivalAirport: "ORD",
                airplaneName: "Airbus A320"
            )
        ]
        mockFlightService.flightsToReturn = expectedFlights

        let expectation = self.expectation(description: "Load flights")
        viewModel.loadFlights { _ in
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1, handler: nil)

        viewModel.setFilter(.concluded) {
            XCTAssertEqual(self.viewModel.numberOfFlights(), 1)
            XCTAssertEqual(self.viewModel.flightInfo(at: 0).flightId, "1")
        }
    }
}

