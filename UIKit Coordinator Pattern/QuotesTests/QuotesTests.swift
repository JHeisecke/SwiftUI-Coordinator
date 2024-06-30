//
//  StoryboardableTests.swift
//  QuotesTests
//
//  Created by Javier Heisecke on 2024-06-30.
//  Copyright © 2024 Code Foundry. All rights reserved.
//

import XCTest
@testable import Quotes

final class StoryboardableTests: XCTestCase {

    func testQuotesViewController() throws {
        _ = QuotesViewController.instantiate()
    }
    
    func testSettingsViewController() throws {
        _ = SettingsViewController.instantiate()
    }

}
