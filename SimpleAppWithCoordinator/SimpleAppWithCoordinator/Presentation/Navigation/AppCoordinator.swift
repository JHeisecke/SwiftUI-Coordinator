//
//  AppCoordinator.swift
//  SimpleAppWithCoordinator
//
//  Created by Javier Heisecke on 2024-06-26.
//

import Foundation
import SwiftUI

final class AppCoordinator: ObservableObject {
    @Published var path: NavigationPath

    init(path: NavigationPath) {
        self.path = path
    }

    @ViewBuilder
    func view() -> some View {
        MainView()
    }
}
