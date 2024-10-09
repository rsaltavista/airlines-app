//
//  FlightsHeaderView.swift
//  Airlines
//
//  Created by Ricardo Altavista on 08/10/24.
//

import UIKit

final class FlightsHeaderView: UICollectionReusableView {
    
    static let identifier = "FlightsHeaderView"
    
    private let filterOptions = ["Todos", "Concluídos", "Cancelados", "Programados"]
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
        
        addFilterButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addFilterButtons() {
        filterOptions.forEach {
            stackView.addArrangedSubview(FilterButton(title: $0))
        }
    }
}
