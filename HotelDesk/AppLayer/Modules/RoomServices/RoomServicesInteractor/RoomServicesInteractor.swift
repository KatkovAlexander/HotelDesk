//
//  RoomServicesInteractor.swift
//  HotelDesk
//
//  Created by Александр Катков on 07.10.2022.
//  
//

import Foundation

class RoomServicesInteractor {

    weak var output: RoomServicesInteractorOutput!

    var servieces: [CreatedRoomServieceCellModel] = []
}

// MARK: Extension - RoomServicesInteractorInput
extension RoomServicesInteractor: RoomServicesInteractorInput {
    
    func addToServices(serviece: CreatedRoomServieceCellModel) {
        servieces.append(serviece)
        output.serviecesUpdated()
    }
    
    func deleteService(servieceId: Int) {
        guard let index = servieces.firstIndex(where: { $0.servieceId == servieceId }) else {
            return
        }
        servieces.remove(at: index)
        output.serviecesUpdated()
    }
}
