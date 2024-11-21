//
//  ProfileViewController.swift
//  FlowCoordinatorEx
//
//  Created by FSSDeveloper on 21/11/24.
//

import UIKit

class ProfileViewController : UIViewController {
    var onLogout: (() -> Void)?
    var goBack: (() -> Void)?
    var viewModel: ProfileViewModelProtocol!

    override func viewDidLoad() {
           super.viewDidLoad()
       }
    
    @IBAction func doLogout(_ sender: UIButton) {
        onLogout!()
    }
    
    @IBAction func doBack(_ sender: UIButton) {
        goBack!()
    }
}
