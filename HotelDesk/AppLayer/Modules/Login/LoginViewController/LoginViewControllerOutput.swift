//
//  LoginViewControllerOutput.swift
//  HotelDesk
//
//  Created by Александр Катков on 19.09.2022.
//

import Foundation

protocol LoginViewControllerOutput: AnyObject {
    
    func viewIsReady()
    
    func didTapScanQRCode()
    
    func didTapEnterAsGuest()
}
