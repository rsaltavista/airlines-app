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
        let departureTimeText: String
        let arrivalTimeText: String
        let startDate: String
        let isConcluded: Bool
        let isCanceled: Bool
        
        var departureAirportLabelText: String {
            "De: \(departureAirportText)"
        }
        
        var arrivalAirportLabelText: String {
            "Para: \(arrivalAirportText)"
        }
        
        var statusLabelText: String {
            "Status: \(statusText)"
        }
        
        var flightTimeLabelText: String {
            "Partida: \(departureTimeText) - Chegada: \(arrivalTimeText)"
        }
        
        var DateLabelText: String {
            "Dia: \(startDate)"
        }
    }
    
    private let departureAirportLabel = UILabel()
    private let arrivalAirportLabel = UILabel()
    private let statusLabel = UILabel()
    private let flightTimeLabel = UILabel()
    private let DateLabel = UILabel()
    
    private let statusIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        
        departureAirportLabel.font = UIFont.boldSystemFont(ofSize: 14)
        departureAirportLabel.numberOfLines = 0
        departureAirportLabel.lineBreakMode = .byWordWrapping
        
        arrivalAirportLabel.font = UIFont.boldSystemFont(ofSize: 14)
        arrivalAirportLabel.numberOfLines = 0
        arrivalAirportLabel.lineBreakMode = .byWordWrapping
        
        statusLabel.font = UIFont.boldSystemFont(ofSize: 14)
        flightTimeLabel.font = UIFont.systemFont(ofSize: 14)
        DateLabel.font = UIFont.systemFont(ofSize: 14)
        
        contentView.addSubview(departureAirportLabel)
        contentView.addSubview(arrivalAirportLabel)
        contentView.addSubview(statusLabel)
        contentView.addSubview(flightTimeLabel)
        contentView.addSubview(DateLabel)
        contentView.addSubview(statusIconImageView)
        
        departureAirportLabel.translatesAutoresizingMaskIntoConstraints = false
        arrivalAirportLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        flightTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        DateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            departureAirportLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            departureAirportLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            departureAirportLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            arrivalAirportLabel.topAnchor.constraint(equalTo: departureAirportLabel.bottomAnchor, constant: 5),
            arrivalAirportLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            arrivalAirportLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            statusLabel.topAnchor.constraint(equalTo: arrivalAirportLabel.bottomAnchor, constant: 5),
            statusLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            
            statusIconImageView.centerYAnchor.constraint(equalTo: statusLabel.centerYAnchor),
            statusIconImageView.trailingAnchor.constraint(equalTo: statusLabel.leadingAnchor, constant: -3),
            statusIconImageView.widthAnchor.constraint(equalToConstant: 20),
            statusIconImageView.heightAnchor.constraint(equalToConstant: 20),
            
            DateLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 5),
            DateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            flightTimeLabel.topAnchor.constraint(equalTo: DateLabel.bottomAnchor, constant: 5),
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
        DateLabel.text = model.DateLabelText
        
        if model.isConcluded {
            statusIconImageView.image = UIImage(systemName: "checkmark.circle.fill") // Ícone de checkmark
            statusIconImageView.tintColor = .systemGreen
        } else if model.isCanceled {
            statusIconImageView.image = UIImage(systemName: "exclamationmark.triangle.fill") // Ícone de alerta
            statusIconImageView.tintColor = .red
        } else {
            statusIconImageView.image = nil // Remove o ícone se não for concluído ou cancelado
        }
    }
}
