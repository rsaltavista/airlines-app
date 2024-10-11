//
//  FlightServiceTests.swift
//  AirlinesTests
//
//  Created by Ricardo Altavista on 11/10/24.
//

import XCTest
@testable import Airlines

final class FlightServiceTests: XCTestCase {
    var service: FlightService?
    
    override func setUp() {
        super.setUp()
        service = FlightService()
    }
    
    override func tearDown() {
        service = nil
        super.tearDown()
    }
    
    func testLoadFlights(){
        service?.loadFlights(completion: { result in
            switch result {
            case .success(let flights):
                XCTAssertEqual(flights.count, 20)
            case .failure:
                XCTFail("Fail loading flights from json")
            }
        })
    }
}
