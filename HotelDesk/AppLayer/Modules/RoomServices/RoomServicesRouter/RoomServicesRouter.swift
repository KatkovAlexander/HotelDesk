//
//  RoomServicesRouter.swift
//  HotelDesk
//
//  Created by Александр Катков on 07.10.2022.
//  
//

import Foundation

class RoomServicesRouter: RoomServicesRouterInput {

    private weak var transitionHandler: TransitionHandler?
    
    init(transitionHandler: TransitionHandler) {
        self.transitionHandler = transitionHandler
    }
    
    func close() {
        transitionHandler?.back()
    }
    
    func openModal(type: CreateRoomServiceCellSelectedLabelType, delegate: RoomServicePickerDelegate, selectedCategory: String?) {
        let viewController = RoomServicePickerConfigurator().configure(type: type, delegate: delegate, selectedCategory: selectedCategory)
        transitionHandler?.openModal(viewController)
    }
}

