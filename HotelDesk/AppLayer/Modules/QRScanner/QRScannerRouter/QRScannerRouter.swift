//
//  QRScannerRouter.swift
//  HotelDesk
//
//  Created by Александр Катков on 20.09.2022.
//  
//

import Foundation

class QRScannerRouter: QRScannerRouterInput {

    private weak var transitionHandler: TransitionHandler?
    
    init(transitionHandler: TransitionHandler) {
        self.transitionHandler = transitionHandler
    }
    
    func popBack() {
        print(#fileID, #function)
        
        transitionHandler?.back()
    }
    
    func openMain() {
        print(#fileID, #function)
        
        GlobalRouter.instance.setMain()
    }
}

