//
//  ViewController.swift
//  FlowCoordinatorEx
//
//  Created by FSSDeveloper on 13/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveLoginState(isLoggedIn: true, token: "")
        coordinator = MainCoordinator(uiNavCtrl: self.navigationController!)
        coordinator?.start()
    }
    
    func saveLoginState(isLoggedIn: Bool, token: String?) {
        UserDefaults.standard.set(isLoggedIn, forKey: "isLoggedIn")
        if let token = token {
            UserDefaults.standard.set(token, forKey: "authToken")
        }
        UserDefaults.standard.synchronize() // To immediately persist data
    }
    
    
}

