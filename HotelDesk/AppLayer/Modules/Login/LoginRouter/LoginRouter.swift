//
//  LoginRouter.swift
//  HotelDesk
//
//  Created by Александр Катков on 19.09.2022.
//

import Foundation

class LoginRouter: LoginRouterInput {
    
    private weak var transitionHandler: TransitionHandler?
    
    init(transitionHandler: TransitionHandler) {
        self.transitionHandler = transitionHandler
    }
    
    func openQRCodeScanner() {
        print(#fileID, #function)
        
//        transitionHandler?.push(QRScannerConfigurator().configure())
    }
    
    func openMain() {
        print(#fileID, #function)
        
        GlobalRouter.instance.setMain()
    }
}
