//
//  LoginViewController.swift
//  HotelDesk
//
//  Created by Александр Катков on 19.09.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    var output: LoginViewControllerOutput!
    
    // MARK: Outlets
    
    @IBOutlet private weak var scanQRButton: DesignableButton! {
        didSet {
            scanQRButton.setTitle("Войти в систему", for: .normal)
        }
    }
    @IBOutlet private weak var enterAsGuestButton: DesignableButton! {
        didSet {
            enterAsGuestButton.setTitle("Просмотр", for: .normal)
        }
    }
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        output.viewIsReady()
    }
    
    // MARK: Action
    
    @IBAction func scanQRCodeButtonAction(_ sender: UIButton) {
        print(#fileID, #function)
        
        output.didTapScanQRCode()
    }
    
    @IBAction func enterAsGuestButtonAction(_ sender: Any) {
        print(#fileID, #function)
        
        output.didTapEnterAsGuest()
    }
    
    
}

extension LoginViewController: LoginViewControllerInput {
    
}
