//
//  LoginCoordinator.swift
//  FlowCoordinatorEx
//
//  Created by FSSDeveloper on 13/11/24.
//

import UIKit

class ProfileCoordinator {
    // Callback for authentication completion
    var onLogout: (() -> Void)?
    private var authCoordinator: AuthCoordinator?
    
    private let navCntrl: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navCntrl = navigationController
    }
    
    func start(){
        navigateToDashboard()
    }
    
    func navigateToRegister() {
        // Create and start the AuthCoordinator to navigate to the Register screen
        authCoordinator = AuthCoordinator(navigationController: navCntrl)
        authCoordinator?.navigateToRegister()
    }
    
    
    func navigateToDashboard() {
        guard let vc = UIStoryboard(name: "dashboard", bundle: .main).instantiateViewController(withIdentifier: "DashboardViewController") as? DashboardViewController else {
            print("DashboardViewController not found")
            return
        }
        vc.onLogout = { [weak self] in
            self?.handleLogout()
        }
        vc.navProfile = { [weak self] in
            self?.navigateToProfile()
            
        }
        navCntrl.pushViewController(vc, animated: true)
    }
    
    func navigateToProfile() {
        guard let vc = UIStoryboard(name: "profile", bundle: .main).instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController else {
            print("ProfileViewController not found")
            return
        }
        vc.goBack = { [weak self] in
            self?.goBack()
        }
        vc.onLogout = { [weak self] in
            self?.handleLogout()
        }
        navCntrl.pushViewController(vc, animated: true)
    }
    
    
    
    func navigateToLogin()
    {
        guard let vc = UIStoryboard(name: "Login", bundle: .main).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
            print("LoginViewController not found")
            return
        }
        vc.onLoginComplete = { [weak self] in
            self?.handleLogout()
        }
        self.navCntrl.pushViewController(vc, animated: true)
        
    }
    
    func goBack() {
        // Pop ProfileViewController to go back to Dashboard
        self.navCntrl.popViewController(animated: true)
    }
    
    
    private func handleLogout() {
        // Notify MainCoordinator to switch flows
        //        navigateToLogin()
        // Trigger the closure to navigate to the Register view
        navigateToRegister()
    }
    
}
