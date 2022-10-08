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

    var services: [CreatedRoomServiceCellModel] = []
}

// MARK: Extension - RoomServicesInteractorInput
extension RoomServicesInteractor: RoomServicesInteractorInput {
    
    func addToServices(service: CreatedRoomServiceCellModel) {
        services.append(service)
        output.servicesUpdated()
    }
    
    func deleteService(serviceId: Int) {
        guard let index = services.firstIndex(where: { $0.serviceId == serviceId }) else {
            return
        }
        services.remove(at: index)
        output.servicesUpdated()
    }
}
