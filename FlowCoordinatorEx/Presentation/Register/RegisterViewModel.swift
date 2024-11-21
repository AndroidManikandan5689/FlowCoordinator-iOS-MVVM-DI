//
//  RegisterViewModel.swift
//  FlowCoordinatorEx
//
//  Created by FSSDeveloper on 21/11/24.
//

import Foundation

protocol RegisterViewModelProtocol {
    func registerApi(username: String, password: String, mobileNo: String)
}

class RegisterViewModel: RegisterViewModelProtocol{
    var onRegisterResult: ((Bool, String) -> Void)?
    
    func registerApi(username: String, password: String, mobileNo: String) {
        // Simulate an API call
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            if username == "validUser" && password == "validPass" && !mobileNo.isEmpty {
                self.onRegisterResult?(true, "Registration Successful")
            } else {
                self.onRegisterResult?(false, "Registration Failed: Invalid details")
            }
        }
    }
}



