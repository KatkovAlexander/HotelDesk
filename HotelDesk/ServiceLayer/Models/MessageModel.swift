//
//  MessageModel.swift
//  HotelDesk
//
//  Created by Александр Катков on 05.10.2022.
//

import Foundation

enum MessageType {
    
    case inbox
    
    case outbox
}


struct MessageModel {
    
    let type: MessageType
    let message: String
}
