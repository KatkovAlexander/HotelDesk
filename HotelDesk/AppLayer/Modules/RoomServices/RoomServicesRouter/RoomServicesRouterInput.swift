//
//  RoomServicesRouterInput.swift
//  HotelDesk
//
//  Created by Александр Катков on 07.10.2022.
//  
//

import Foundation

protocol RoomServicesRouterInput: AnyObject {

    func close()
    
    func openModal(type: CreateRoomServieceCellSelectedLabelType, delegate: RoomServiecePickerDelegate)
}
