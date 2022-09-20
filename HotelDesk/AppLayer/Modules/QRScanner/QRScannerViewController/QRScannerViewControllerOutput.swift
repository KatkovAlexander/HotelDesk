//
//  QRScannerViewControllerOutput.swift
//  HotelDesk
//
//  Created by Александр Катков on 20.09.2022.
//  
//


import Foundation
import AVFoundation

protocol QRScannerViewControllerOutput: AnyObject {
    
    func viewDidLoad()
    
    func errorCathed(error: String)
    
    func qrCodeGetted(data: [AVMetadataObject])
    
    func didSwipeRight()
}
