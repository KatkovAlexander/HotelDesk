//
//  ProfileViewController.swift
//  HotelDesk
//
//  Created by Александр Катков on 21.09.2022.
//  
//

import UIKit

class ProfileViewController: UIViewController {
    
    var output: ProfileViewControllerOutput!

    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewDidLoad()
    }
    
}

// MARK: Extension - ProfilePresenterToViewProtocol 
extension ProfileViewController: ProfileViewControllerInput {
    
    func initialSetup(title: String) {
        navigationItem.title = title
    }
}
