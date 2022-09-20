//
//  LoginPresenter.swift
//  HotelDesk
//
//  Created by Александр Катков on 19.09.2022.
//

import Foundation


final class LoginPresenter {
    
    // MARK: Dependencies
    
    private weak var view: LoginViewControllerInput?
    private let router: LoginRouterInput
    
    init(view: LoginViewControllerInput,
         router: LoginRouterInput) {
        self.view = view
        self.router = router
    }
}

extension LoginPresenter: LoginViewControllerOutput {
    
    func viewIsReady() {
        print(#fileID, #function)
    }
    
    func didTapScanQRCode() {
        print(#fileID, #function)
        
        router.openQRCodeScanner()
    }
    
    func didTapEnterAsGuest() {
        print(#fileID, #function)
        
        router.openMain()
    }
}
