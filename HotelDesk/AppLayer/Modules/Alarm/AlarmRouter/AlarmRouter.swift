//
//  AlarmRouter.swift
//  HotelDesk
//
//  Created by Александр Катков on 08.10.2022.
//  
//

import Foundation

class AlarmRouter: AlarmRouterInput {

    private weak var transitionHandler: TransitionHandler?
    
    init(transitionHandler: TransitionHandler) {
        self.transitionHandler = transitionHandler
    }
}

