//
//  FlightsView.swift
//  Airlines
//
//  Created by Ricardo Altavista on 11/10/24.
//

import SwiftUI
import UIKit

struct FlightsView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> FlightsViewController {
        let flightService = FlightService()
        let flightViewModel = FlightViewModel(flightService: flightService)
        
        return FlightsViewController(viewModel: flightViewModel)
    }
    
    func updateUIViewController(_ uiViewController: FlightsViewController, context: Context) {
    }
}



