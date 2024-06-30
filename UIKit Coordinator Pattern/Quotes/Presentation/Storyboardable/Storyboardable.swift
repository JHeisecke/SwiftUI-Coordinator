//
//  Storyboardable.swift
//  Quotes
//
//  Created by Javier Heisecke on 2024-06-30.
//  Copyright © 2024 Code Foundry. All rights reserved.
//

import UIKit

protocol Storyboardable {
    static var storyboardName: String { get }
    static var storyboardBundle: Bundle { get }
    static var storyboardIdentifier: String { get }
    
    static func instantiate() -> Self
}

extension Storyboardable where Self: UIViewController {
    static var storyboardName: String {
        "Main"
    }
    
    static var storyboardBundle: Bundle {
        .main
    }
    
    static var storyboardIdentifier: String {
        String(describing: self)
    }
    
    static func instantiate() -> Self {
        guard let viewController = UIStoryboard(name: storyboardName, bundle: storyboardBundle).instantiateViewController(withIdentifier: storyboardIdentifier) as? Self else {
            fatalError("Unable to instantiate Storyboard with identifier \(storyboardIdentifier)")
        }
        return viewController
    }
}
