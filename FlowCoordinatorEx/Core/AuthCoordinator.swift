//
//  AuthCoordinator.swift
//  FlowCoordinatorEx
//
//  Created by FSSDeveloper on 13/11/24.
//

import Foundation
import UIKit

class AuthCoordinator {
    
    private let navCtrl : UINavigationController
    
    // Callback for authentication completion
    var onAuthComplete: (() -> Void)?
    
    init(navigationController: UINavigationController) {
        self.navCtrl = navigationController
    }
    
    func start(){
        navigateToRegister()
    }
    
    
    func navigateToRegister() {
        // Pop to the root view controller first (clearing any view controllers in between)
        navCtrl.popToRootViewController(animated: false)
        
        guard let vc = UIStoryboard(name: "register", bundle: .main).instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController else {
            print("RegisterViewController not found")
            return
        }
        vc.onRegisterComplete = { [weak self] in
            self?.handleAuthComplete()
        }
        navCtrl.pushViewController(vc, animated: true)
    }
    
    
    func navigateToLogin() {
        guard let vc = UIStoryboard(name: "login", bundle: .main).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
            print("LoginViewController not found")
            return
        }
        vc.onLoginComplete = { [weak self] in
            self?.handleAuthComplete()
        }
        navCtrl.pushViewController(vc, animated: true)
    }
    
    func handleAuthComplete() {
        // Notify MainCoordinator that authentication is complete
        onAuthComplete?()
    }
    
    func navigateToForgotPassword() {
        // Handle navigation to ForgotPasswordViewController
    }
    
    
}
