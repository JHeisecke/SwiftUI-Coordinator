//
//  LoginView.swift
//  SimpleAppWithCoordinator
//
//  Created by Javier Heisecke on 2024-06-26.
//

import SwiftUI

struct LoginView: View {
    
    struct Output {
        var goToMainScreen: () -> Void
        var goToForgotPassword: () -> Void
    }
    
    var output: Output
    
    var body: some View {
        VStack {
            Button(
                action: {
                    self.output.goToMainScreen()
                },
                label: {
                    Text("Login")
                }
            ).padding()
            
            Button(
                action: {
                    self.output.goToForgotPassword()
                },
                label: {
                    Text("Forgot password")
                }
            )
        }
    }
}

#Preview {
    LoginView(output: .init(goToMainScreen: {}, goToForgotPassword: {}))
}
