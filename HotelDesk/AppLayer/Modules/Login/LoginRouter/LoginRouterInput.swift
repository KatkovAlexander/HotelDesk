//
//  LoginRouterInput.swift
//  HotelDesk
//
//  Created by Александр Катков on 19.09.2022.
//

import Foundation

protocol LoginRouterInput: AnyObject {
    
    func openQRCodeScanner()
    
    func openMain()
}
