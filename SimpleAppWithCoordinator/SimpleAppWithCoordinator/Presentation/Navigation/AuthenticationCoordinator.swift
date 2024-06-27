//
//  AuthenticationCoordinator.swift
//  SimpleAppWithCoordinator
//
//  Created by Javier Heisecke on 2024-06-26.
//

import Foundation
import SwiftUI

final class AuthenticationCoordinator: Hashable {
    
    // MARK: - Properties
    
    @Binding var navigationPath: NavigationPath

    private var id: UUID
    private var output: Output?
    private var page: AuthenticationPage
    
    // MARK: - Types
    
    enum AuthenticationPage {
        case login, forgotPassword
    }
    
    struct Output {
        var goToMainScreen: () -> Void
    }
    
    // MARK: - Initialization

    init(
        page: AuthenticationPage,
        navigationPath: Binding<NavigationPath>,
        output: Output? = nil
    ) {
        id = UUID()
        self.page = page
        self.output = output
        self._navigationPath = navigationPath
    }

    // MARK: - Views
    
    @ViewBuilder
    func view() -> some View {
        switch self.page {
            case .login:
                loginView()
            case .forgotPassword:
                forgotPasswordView()
        }
    }

    private func loginView() -> some View {
        let loginView = LoginView(
            output:
                .init(
                    goToMainScreen: {
                        self.output?.goToMainScreen()
                    },
                    goToForgotPassword:  {
                        self.push(
                            AuthenticationCoordinator(
                                page: .forgotPassword,
                                navigationPath: self.$navigationPath
                            )
                        )
                    }
                )
        )
        return loginView
    }

    private func forgotPasswordView() -> some View {
        let forgotPasswordView = ForgotPasswordView(output:
                .init(
                    goToForgotPasswordWebsite: {
                        self.goToForgotPasswordWebsite()
                    }
                )
        )
        return forgotPasswordView
    }

    // MARK: - Navigation
    
    private func goToForgotPasswordWebsite() {
        if let url = URL(string: "https://www.google.com") {
            UIApplication.shared.open(url)
        }
    }

    func push<V>(_ value: V) where V : Hashable {
        navigationPath.append(value)
    }
    
    // MARK: - Conforming
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (
        lhs: AuthenticationCoordinator,
        rhs: AuthenticationCoordinator
    ) -> Bool {
        lhs.id == rhs.id
    }
}
