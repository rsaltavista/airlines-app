//
//  FilterButton.swift
//  Airlines
//
//  Created by Ricardo Altavista on 08/10/24.
//

import UIKit

final class FilterButton: UIButton {
    
    init(title: String) {
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        setTitleColor(.black, for: .normal)
        
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel?.lineBreakMode = .byClipping
        titleLabel?.adjustsFontSizeToFitWidth = false
        
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 40).isActive = true
        widthAnchor.constraint(equalToConstant: 110).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
