//
//  RoomServicesInteractorInput.swift
//  HotelDesk
//
//  Created by Александр Катков on 07.10.2022.
//  
//

import Foundation

protocol RoomServicesInteractorInput: AnyObject {

    var servieces: [CreatedRoomServieceCellModel] { get }
    
    func addToServices(serviece: CreatedRoomServieceCellModel)
    
    func deleteService(servieceId: Int)
}

