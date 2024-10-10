//
//  FilterButton.swift
//  Airlines
//
//  Created by Ricardo Altavista on 08/10/24.
//

import UIKit

final class FilterButton: UIButton {
    
    var isSelectedButton: Bool = false{
        didSet{
            updateBackgroundColor()
        }
    }
    
    init(title: String) {
        super.init(frame: .zero)
        
        var configuration = UIButton.Configuration.filled()
                configuration.title = title
                configuration.baseForegroundColor = .black
                configuration.cornerStyle = .capsule
                configuration.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 12, bottom: 2, trailing: 12)
                self.configuration = configuration
        
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        updateBackgroundColor()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateBackgroundColor(){
        
        let defaultColor = UIColor.lightGray.withAlphaComponent(0.2)
        
        let selectedColor = UIColor.black.withAlphaComponent(0.3)
        
        self.configuration?.baseBackgroundColor = isSelectedButton ? selectedColor : defaultColor

    }
}
