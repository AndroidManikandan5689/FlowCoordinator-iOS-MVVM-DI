//
//  RegisterViewController.swift
//  FlowCoordinatorEx
//
//  Created by FSSDeveloper on 13/11/24.
//

import UIKit


class RegisterViewController : UIViewController {
    var onRegisterComplete: (() -> Void)?
    var viewModel: RegisterViewModelProtocol!

    override func viewDidLoad() {
        viewModel = RegisterViewModel()
           super.viewDidLoad()
       }
    
    
    @IBAction func doRegisterApi(_ sender: UIButton) {
        viewModel.registerApi(username: "String", password: "String", mobileNo: "")
    }
}
