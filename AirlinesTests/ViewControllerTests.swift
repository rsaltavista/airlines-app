//
//  ViewControllerTests.swift
//  AirlinesTests
//
//  Created by Ricardo Altavista on 11/10/24.
//

import XCTest
@testable import Airlines



final class ViewControllerTests: XCTestCase {

    var viewController: FlightsViewController?
    var spyViewModel: SpyViewModel!
    
    override func setUp() {
        super.setUp()
        spyViewModel = SpyViewModel()
        viewController = FlightsViewController(viewModel: spyViewModel)
    }
    
    override func tearDown() {
        spyViewModel = nil
        viewController = nil
        super.tearDown()
    }
    
    private func makeCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return collectionView
    }
    
    func testViewDidLoad(){
        _ = viewController?.view
        
        XCTAssertEqual(spyViewModel.loadFlightsCalled, true)
        
        XCTAssertEqual(spyViewModel.flightInfoCalled, false)
    }
    
    func testCollectionNumberOfFlights() {
        _ = viewController?.view
        
        let numberOfItems = viewController?.collectionView(makeCollectionView(), numberOfItemsInSection: 0)
        
        XCTAssertEqual(spyViewModel.numberOfFlightsCalled, true)
        XCTAssertEqual(numberOfItems, spyViewModel.numberOfFlights())
    }
    
    func testCollectionFlightItem() {
        _ = viewController?.view
        
        let collectionView = makeCollectionView()
        collectionView.register(FlightCell.self, forCellWithReuseIdentifier: "FlightCell")
        
        _ = viewController?.collectionView(collectionView, cellForItemAt: IndexPath(item: 0, section: 0))
        
        XCTAssertEqual(spyViewModel.flightInfoCalled, true)
        XCTAssertEqual(spyViewModel.flightInfoIndexCalled, 0)
    }
    
    func testSetFilter() {
        _ = viewController?.view
        
        viewController?.setFilter(filterOption: .cancelled)
        
        XCTAssertEqual(spyViewModel.setFilterCalled, true)
        XCTAssertEqual(spyViewModel.setFilterOptionCalled, .cancelled)
    }
}
