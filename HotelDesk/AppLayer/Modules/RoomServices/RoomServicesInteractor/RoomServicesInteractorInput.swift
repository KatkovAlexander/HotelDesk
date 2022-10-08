//
//  RoomServicesInteractorInput.swift
//  HotelDesk
//
//  Created by Александр Катков on 07.10.2022.
//  
//

import Foundation

protocol RoomServicesInteractorInput: AnyObject {

    var services: [CreatedRoomServiceCellModel] { get }
    
    func addToServices(service: CreatedRoomServiceCellModel)
    
    func deleteService(serviceId: Int)
}

