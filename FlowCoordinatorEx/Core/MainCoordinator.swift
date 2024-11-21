//
//  MainCoordinator.swift
//  FlowCoordinatorEx
//
//  Created by FSSDeveloper on 13/11/24.
//

import Foundation
import UIKit

//Base Protocol for Coordinator
protocol CoordinatorProtocol{
    func start()
}

class MainCoordinator : CoordinatorProtocol{
    
    private let uiNavCtrl: UINavigationController
    private var isLogged: Bool {
            // Dynamically determine login state (e.g., using UserDefaults or a token manager)
            return UserDefaults.standard.bool(forKey: "isLoggedIn")
        }
    var profileCoordinator: ProfileCoordinator?
    var authCoordinator: AuthCoordinator?
    
    init(uiNavCtrl: UINavigationController) {
        self.uiNavCtrl = uiNavCtrl
    }
    
    
    func start() {
        if isLogged {
                navProfileCoordinator()
        } else {
                navAuthCoordinator()
        }
        
    }
    
    func navProfileCoordinator(){
        
        profileCoordinator = ProfileCoordinator(navigationController: uiNavCtrl)
        profileCoordinator?.start()
        // Handle completion from ProfileCoordinator
        profileCoordinator?.onLogout = { [weak self] in
            self?.navAuthCoordinator()
        }
        
    }
    
    func navAuthCoordinator(){
        
        authCoordinator = AuthCoordinator(navigationController: uiNavCtrl)
        authCoordinator?.start()
        
        // Handle completion from AuthCoordinator
        authCoordinator?.onAuthComplete = { [weak self] in
            self?.navProfileCoordinator()
        }
        
    }
}
