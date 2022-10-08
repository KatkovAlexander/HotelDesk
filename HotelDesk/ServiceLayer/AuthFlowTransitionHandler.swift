//
//  AuthFlowTransitionHandler.swift
//  HotelDesk
//
//  Created by Александр Катков on 09.10.2022.
//

import Foundation
import UIKit

protocol AuthFlowTransitionHandler: AnyObject {
    
    func openAuthModal()
}

extension AuthFlowTransitionHandler where Self: UIViewController {
    
    func openAuthModal() {
        openModal(QRScannerConfigurator().configure())
    }
}
