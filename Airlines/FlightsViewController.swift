//
//  FlightsViewController.swift
//  Airlines
//
//  Created by Ricardo Altavista on 07/10/24.
//

import UIKit

final class FlightsViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    private var viewModel: FlightViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = FlightViewModel()
        setupCollectionView()
        setupNavigationBar()
        
        viewModel.onFlightsUpdated = { [weak self] in
            self?.collectionView.reloadData()
        }
        viewModel.loadFlights()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: 150)
        layout.minimumLineSpacing = 10
        layout.headerReferenceSize = CGSize(width: view.frame.size.width, height: 60)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(FlightCell.self, forCellWithReuseIdentifier: "FlightCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        collectionView.register(
            FlightsHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: FlightsHeaderView.identifier
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupNavigationBar() {
//        let logoImage = UIImage(named: "logowayairlines")
//        let logoImageView = UIImageView(image: logoImage)
//        logoImageView.contentMode = .scaleAspectFit
//        
//        let logoContainerView = UIView(frame: CGRect(x: 0, y: -15, width: 100, height: 80))
//        logoImageView.frame = CGRect(x: 0, y: -15, width: 50, height: 80)
//        logoContainerView.addSubview(logoImageView)
//        
//        let logoBarButtonItem = UIBarButtonItem(customView: logoContainerView)
//        navigationItem.leftBarButtonItem = logoBarButtonItem
        
        let titleLabel = UILabel()
        titleLabel.text = "Flights"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textColor = .black
        
        let titleContainerView = UIView()
        titleContainerView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: titleContainerView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: titleContainerView.centerYAnchor)
        ])
        
        navigationItem.titleView = titleContainerView
        
        if let navigationBar = navigationController?.navigationBar {
                navigationBar.isTranslucent = false // Desativa a translucidez
                navigationBar.shadowImage = UIImage() // Remove a sombra da barra de navegação (opcional)
                
                // Se quiser que o fundo da status bar combine, pode ajustar aqui
                let appearance = UINavigationBarAppearance()
                appearance.backgroundColor = .white // Cor de fundo
                navigationBar.standardAppearance = appearance
                navigationBar.scrollEdgeAppearance = appearance
            }
    }
}

extension FlightsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfFlights()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FlightCell", for: indexPath) as! FlightCell
        let flightModel = viewModel.flightInfo(at: indexPath.row)
        cell.configure(with: flightModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader, let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FlightsHeaderView.identifier, for: indexPath) as? FlightsHeaderView else {
            return UICollectionReusableView()
        }
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedFlight = viewModel.flights[indexPath.row]
        print("Voo selecionado: \(selectedFlight.flightId)")
    }
}


