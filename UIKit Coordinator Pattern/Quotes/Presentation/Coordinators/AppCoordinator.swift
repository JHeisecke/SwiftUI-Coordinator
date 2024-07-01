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
        let quotesViewController = QuotesViewController.instantiate()
        
        quotesViewController.didShowQuote = { [weak self] quote in
            guard let self else { return }
            showQuote(quote)
        }        
        quotesViewController.didShowSettings = { [weak self] in
            guard let self else { return }
            showSettings()
        }
        
        navigationController.pushViewController(quotesViewController, animated: true)
    }
    
    private func showQuote(_ quote: Quote) {
        let quoteViewController = QuoteViewController.instantiate()
        quoteViewController.quote = quote
        navigationController.pushViewController(quoteViewController, animated: true)
    }
    
    private func showSettings() {
        let settingsViewController = SettingsViewController.instantiate()
        
        settingsViewController.didHide = { [weak self] in
            guard let self else { return }
            navigationController.dismiss(animated: true)
        }
        
        navigationController.present(settingsViewController, animated: true)
    }
}
