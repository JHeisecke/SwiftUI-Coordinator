//
//  ForgotPasswordView.swift
//  SimpleAppWithCoordinator
//
//  Created by Javier Heisecke on 2024-06-26.
//

import SwiftUI

struct ForgotPasswordView: View {
    struct Output {
        var goToForgotPasswordWebsite: () -> Void
    }

    var output: Output

    var body: some View {
        Button(
            action: {
                self.output.goToForgotPasswordWebsite()
            },
            label: {
                Text("Forgot password")
            }
        ).padding()
    }
}

#Preview {
    ForgotPasswordView(output: .init(goToForgotPasswordWebsite: {}))
}
