//
//  MenuViewController.swift
//  HotelDesk
//
//  Created by Александр Катков on 21.09.2022.
//  
//

import UIKit

class MenuViewController: UIViewController {
    
    var output: MenuViewControllerOutput!

    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        output.viewDidLoad()
    }
    
}

// MARK: Extension - MenuPresenterToViewProtocol 
extension MenuViewController: MenuViewControllerInput {
    
    func initialSetup(title: String) {
        navigationItem.title = title
    }
}
