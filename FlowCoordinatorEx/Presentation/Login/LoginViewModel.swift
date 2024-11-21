//
//  LoginViewModel.swift
//  FlowCoordinatorEx
//
//  Created by FSSDeveloper on 13/11/24.
//

import Foundation

protocol LoginViewModelProtocol {
    func login(username: String, password: String)
}

class LoginViewModel: LoginViewModelProtocol {
    var onLoginSuccess: (() -> Void)?
    var onLoginFailure: ((String) -> Void)?
    var onLoginResult: ((Bool, String) -> Void)?

    func login(username: String, password: String) {
        // Simulate login logic
        if username == "user" && password == "password" {
            onLoginSuccess?()
            onLoginResult?(true, "Login Successful")
        } else {
            onLoginFailure?("Invalid credentials")
            onLoginResult?(false, "Invalid username or password")
        }
    }
}
