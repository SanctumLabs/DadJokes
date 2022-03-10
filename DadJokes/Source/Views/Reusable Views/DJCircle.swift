//
//  DJCircle.swift
//  DadJokes
//
//  Created by George Nyakundi on 22/02/2022.
//

import Foundation
import UIKit

final class DJCircle: UIView {
    // MARK: - Properties
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(withColor: UIColor, ofSize: CGFloat, withOpacity: Float){
        super.init(frame: .zero)
        self.backgroundColor = withColor
        self.layer.cornerRadius = ofSize / 2
        self.layer.opacity = withOpacity
//        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Private Methods
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBlue
        layer.cornerRadius = 20
    }
}
