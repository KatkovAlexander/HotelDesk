//
//  Globals.swift
//  HotelDesk
//
//  Created by Александр Катков on 21.09.2022.
//

import Foundation
import AVFoundation

class Globals {
    
    static var authed = false
    
    static let correctLink = "http://drive.google.com/file/d/1OvDjAWEZTB2vakG1HRZDX70QsPn5Cw2f/view?usp=sharing"
    
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
    
    static let RoomServieceDic: [String: [String]] = ["Меню подушек" : ["Заменить на пуховую",
                                                                        "Заменить на ортопедическую",
                                                                        "Заменить на гипоаллергенную",
                                                                        "Заменить на супер жесткую из гречихи",
                                                                        "Заменить на подушку для беременных"],
                                                      "Меню ванных принадлежностей" : ["Гель для душа",
                                                                                       "Шампунь для волос",
                                                                                       "Мыло для рук",
                                                                                       "Бритвенный набор",
                                                                                       "Крем для тела",
                                                                                       "Шапочка для душа",
                                                                                       "Зубной набор"],
                                                      "Ванный комплект" : ["Халат S",
                                                                           "Халат M",
                                                                           "Халат L",
                                                                           "Полотенце для рук",
                                                                           "Полотенце для ног",
                                                                           "Полотенце для лица",
                                                                           "Полотенце для тела",
                                                                           "Тапочки"],
                                                      "Дополнительно" : ["Губка для обуви",
                                                                         "Швейный набор",
                                                                         "Зонт"]]
                                                      
}
