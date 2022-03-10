//
//  DJTitleLabel.swift
//  DadJokes
//
//  Created by George Nyakundi on 20/02/2022.
//

import Foundation
import UIKit

class DJTitleLabel: UILabel {
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(txtAlignmnent: NSTextAlignment = .left, fontSize: CGFloat) {
        super.init(frame: .zero)
        self.textAlignment = txtAlignmnent
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        configure()
    }
    
    // MARK: - Private
    /// Configures the views with the default properties
    private func configure() {
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.90
        lineBreakMode = .byWordWrapping
        numberOfLines = 0
        translatesAutoresizingMaskIntoConstraints = false
    }
}
