//
//  SimpleAppWithCoordinatorApp.swift
//  SimpleAppWithCoordinator
//
//  Created by Javier Heisecke on 2024-06-26.
//

import SwiftUI

@main
struct SimpleAppWithCoordinatorApp: App {
    @StateObject private var appCoordinator = AppCoordinator(path: NavigationPath())

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $appCoordinator.path) {
                appCoordinator.view()
                    .navigationDestination(
                        for: AuthenticationCoordinator.self
                    ) { coordinator in
                        coordinator.view()
                    }
            }
            .environmentObject(appCoordinator)
        }
    }
}
