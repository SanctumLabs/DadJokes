//
//  MainViewController+Ext.swift
//  DadJokes
//
//  Created by George Nyakundi on 04/03/2022.
//

import Foundation
import UIKit

extension MainViewController {
    @objc func likeJoke(_ sender: UIButton) {
        print("You have like me \(joke?.id ?? "") ")
    }
    
    @objc func loveJoke(_ sender: UIButton) {
        print("You have loved me \(joke?.id ?? "")")
    }
    
    @objc func dislikeJoke(_ sender: UIButton) {
        print("You have dislike me \(joke?.id ?? "")")
    }
    
    @objc func shareJoke(_ sender: UIButton) {
        print("You want to share me \(joke?.id ?? "")")
    }
}
