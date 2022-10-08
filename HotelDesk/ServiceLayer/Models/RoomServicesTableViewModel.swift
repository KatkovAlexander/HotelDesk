//
//  RoomServicesTableViewModel.swift
//  HotelDesk
//
//  Created by Александр Катков on 07.10.2022.
//

import Foundation


enum RoomServicesTableViewCellType {
    
    case created(_ model: CreatedRoomServiceCellModel)
    
    case add
    
    case create(_ model: CreateRoomServiceCellModel)
}
