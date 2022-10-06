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
}

