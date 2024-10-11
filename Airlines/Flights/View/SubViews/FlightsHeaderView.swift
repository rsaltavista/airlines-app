//
//  FlightsHeaderView.swift
//  Airlines
//
//  Created by Ricardo Altavista on 08/10/24.
//

import UIKit

final class FlightsHeaderView: UICollectionReusableView {
    
    static let identifier = "FlightsHeaderView"
    
    private var buttons: [FilterButton] = []
    
    var onFilterButtonTapped: ((FilterOption) -> Void)?
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = -30
        stackView.distribution = .equalSpacing
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
        FilterOption.allCases.forEach {
            let filterButton = FilterButton(title: $0.title)
            filterButton.tag = $0.rawValue
            filterButton.addTarget(self, action: #selector(filterButtonTapped(_:)), for: .touchUpInside)
            stackView.addArrangedSubview(filterButton)
            buttons.append(filterButton)
            
            if $0 == .all {
                filterButton.isSelectedButton = true
            }
        }
    }
    
    @objc private func filterButtonTapped(_ button: FilterButton) {
        guard let filterOption = FilterOption(rawValue: button.tag) else {
            return
        }
        buttons.forEach{ $0.isSelectedButton = false}
        button.isSelectedButton = true
        onFilterButtonTapped?(filterOption)
    }
}
