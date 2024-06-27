//
//  MainView.swift
//  SimpleAppWithCoordinator
//
//  Created by Javier Heisecke on 2024-06-26.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator

    var body: some View {
        Group {
            AuthenticationCoordinator(
                page: .login,
                navigationPath: $appCoordinator.path,
                output: .init(
                    goToMainScreen: {
                        print("Go to main screen (MainTabView)")
                    }
                )
            ).view()
        }
    }
}

#Preview {
    MainView()
}
