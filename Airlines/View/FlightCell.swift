//
//  FlightCell.swift
//  Airlines
//
//  Created by Ricardo Altavista on 08/10/24.
//

import UIKit
final class FlightCell: UICollectionViewCell {
    
    struct Model {
        let departureAirportText: String
        let arrivalAirportText: String
        let statusText: String
        let statusCompletionText: String
        let departureTimeText: String
        let arrivalTimeText: String
        
        var departureAirportLabelText: String {
            "De: \(departureAirportText)"
        }
        
        var arrivalAirportLabelText: String {
            "Para: \(arrivalAirportText)"
        }
        
        var statusLabelText: String {
            "Status: \(statusText) - \(statusCompletionText)"
        }
        
        var flightTimeLabelText: String {
            "\(departureTimeText) - \(arrivalTimeText)"
        }
    }
    
    private let departureAirportLabel = UILabel()
    private let arrivalAirportLabel = UILabel()
    private let statusLabel = UILabel()
    private let flightTimeLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGray
        layer.cornerRadius = 10
        
        departureAirportLabel.font = UIFont.boldSystemFont(ofSize: 14)
        arrivalAirportLabel.font = UIFont.systemFont(ofSize: 16)
        statusLabel.font = UIFont.systemFont(ofSize: 14)
        flightTimeLabel.font = UIFont.systemFont(ofSize: 14)
        
        contentView.addSubview(departureAirportLabel)
        contentView.addSubview(arrivalAirportLabel)
        contentView.addSubview(statusLabel)
        contentView.addSubview(flightTimeLabel)
        
        departureAirportLabel.translatesAutoresizingMaskIntoConstraints = false
        arrivalAirportLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        flightTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            departureAirportLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            departureAirportLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            arrivalAirportLabel.topAnchor.constraint(equalTo: departureAirportLabel.bottomAnchor, constant: 5),
            arrivalAirportLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            statusLabel.topAnchor.constraint(equalTo: arrivalAirportLabel.bottomAnchor, constant: 5),
            statusLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            flightTimeLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 5),
            flightTimeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: FlightCell.Model) {
        statusLabel.text = model.statusLabelText
        departureAirportLabel.text = model.departureAirportLabelText
        arrivalAirportLabel.text = model.arrivalAirportLabelText
        flightTimeLabel.text = model.flightTimeLabelText
    }
}

