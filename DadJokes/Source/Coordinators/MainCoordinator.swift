//
//  MainCoordinator.swift
//  DadJokes
//
//  Created by George Nyakundi on 18/02/2022.
//

import Foundation
import UIKit

final class MainCoordinator: Coordinator {
    internal var childCoordinators: [Coordinator] = []
    private let navController: UINavigationController
    private let dadJokesNetworking = DadJokesNetworking()
    private let mainViewController = MainViewController()
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
        
        mainViewController.coordinator = self
        navController.viewControllers = [mainViewController]
    }
    
    func getRandomJoke() {
        mainViewController.isLoading = true
        mainViewController.hasError = false
        DadJokesNetworking.shared.fetchRandomJoke {[weak self] result in
            self?.mainViewController.isLoading = false
            switch result {
            case .failure:
                self?.mainViewController.hasError = true
            case .success(let joke):
                self?.mainViewController.joke = joke
            }
        }
    }
    
    func addToFavorites(){
        print("Added to favorites ❤️")
    }
    
    func didntLikeIt() {
        print("Added to favorites 🥲")
    }
    
}
