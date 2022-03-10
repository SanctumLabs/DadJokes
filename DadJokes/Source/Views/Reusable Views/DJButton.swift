//
//  DJButton.swift
//  DadJokes
//
//  Created by George Nyakundi on 20/02/2022.
//

import Foundation
import UIKit

class DJButton: UIButton {
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(bgColor: UIColor, title: String) {
        super.init(frame: .zero)
        setBackground(to: bgColor)
        setTitle(to: title)
        
        configure()
    }
    
    // MARK: - Private Functions
    /// Configure DJButton constraints
    private func configure(){
        layer.cornerRadius = Spacers.normal.rawValue
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Helper functions
    /// Sets background color to a specified color
    /// - Parameter to: UIColor
    func setBackground(to: UIColor) {
        self.backgroundColor = to
    }
    /// Sets the Button's title
    /// - Parameters:
    ///   - to: Text to which the title should have
    ///   - state: UIControl.state
    func setTitle(to: String, state: UIControl.State = .normal) {
        setTitle(to, for: state)
    }
    
}
