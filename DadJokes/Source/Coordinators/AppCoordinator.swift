//
//  AppCoordinator.swift
//  DadJokes
//
//  Created by George Nyakundi on 18/02/2022.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    private let window: UIWindow?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        let mainCoordinator = MainCoordinator(navController: navigationController)
        childCoordinators.append(mainCoordinator)
        mainCoordinator.start()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
}
