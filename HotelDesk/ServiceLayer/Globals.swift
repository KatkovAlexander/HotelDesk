//
//  Globals.swift
//  HotelDesk
//
//  Created by Александр Катков on 21.09.2022.
//

import Foundation
import AVFoundation

class Globals {
    
    static let correctLink = "https://www.husqvarna.com/Automower/"
    
    static let supportedCodeTypes = [AVMetadataObject.ObjectType.upce,
                                     AVMetadataObject.ObjectType.code39,
                                     AVMetadataObject.ObjectType.code39Mod43,
                                     AVMetadataObject.ObjectType.code93,
                                     AVMetadataObject.ObjectType.code128,
                                     AVMetadataObject.ObjectType.ean8,
                                     AVMetadataObject.ObjectType.ean13,
                                     AVMetadataObject.ObjectType.aztec,
                                     AVMetadataObject.ObjectType.pdf417,
                                     AVMetadataObject.ObjectType.itf14,
                                     AVMetadataObject.ObjectType.dataMatrix,
                                     AVMetadataObject.ObjectType.interleaved2of5,
                                     AVMetadataObject.ObjectType.qr]
}
