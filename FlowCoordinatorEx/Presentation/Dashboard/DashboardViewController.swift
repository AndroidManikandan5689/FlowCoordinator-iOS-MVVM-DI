//
//  DashboardViewController.swift
//  FlowCoordinatorEx
//
//  Created by FSSDeveloper on 21/11/24.
//


import UIKit

class DashboardViewController : UIViewController {
    var onLogout: (() -> Void)?
    var navProfile: (() -> Void)?
    var viewModel: DashboardViewModelProtocol!

    override func viewDidLoad() {
           super.viewDidLoad()
       }
    @IBAction func navigateToProfile(_ sender: UIButton) {
        navProfile!()
    }
}
