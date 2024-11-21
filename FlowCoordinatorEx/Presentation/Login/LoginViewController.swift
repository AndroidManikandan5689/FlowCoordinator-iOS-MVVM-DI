//
//  LoginVC.swift
//  FlowCoordinatorEx
//
//  Created by FSSDeveloper on 13/11/24.
//
import UIKit

class LoginViewController : UIViewController {
    var onLoginComplete: (() -> Void)?
    
    var viewModel: LoginViewModelProtocol!

    override func viewDidLoad() {
           super.viewDidLoad()
        viewModel = LoginViewModel()
       }
    

    
    @IBAction func doLogin(_ sender: Any) {
        viewModel.login(username: "user", password: "password")
    }
    
}
