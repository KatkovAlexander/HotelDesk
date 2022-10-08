//
//  QRScannerViewControllerInput.swift
//  HotelDesk
//
//  Created by Александр Катков on 20.09.2022.
//  
//


import Foundation

protocol QRScannerViewControllerInput: AnyObject {
    
    func initialSetup(title: String)
    
    func showError(error: String)
    
    func close()
}
