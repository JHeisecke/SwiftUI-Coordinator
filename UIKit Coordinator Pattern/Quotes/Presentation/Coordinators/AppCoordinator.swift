//
//  AppCoordinator.swift
//  Quotes
//
//  Created by Javier Heisecke on 2024-06-30.
//  Copyright © 2024 Code Foundry. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator {
    
    private let navigationController = UINavigationController()
    
    var rootViewController: UIViewController {
        return navigationController
    }
    
    func start() {
        showQuotes()
    }
    
    private func showQuotes() {
        navigationController.pushViewController(QuotesViewController.instantiate(), animated: true)
    }
}
