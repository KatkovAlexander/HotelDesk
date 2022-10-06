//
//  MenuRouter.swift
//  HotelDesk
//
//  Created by Александр Катков on 21.09.2022.
//  
//

import Foundation

class MenuRouter: MenuRouterInput {

    private weak var transitionHandler: TransitionHandler?
    
    init(transitionHandler: TransitionHandler) {
        self.transitionHandler = transitionHandler
    }
    
    func openRoomServices() {
        transitionHandler?.push(RoomServicesConfigurator().configure())
    }
}

