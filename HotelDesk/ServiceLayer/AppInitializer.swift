//
//  AppInitializer.swift
//  HotelDesk
//
//  Created by Александр Катков on 21.09.2022.
//

import UIKit

class AppInitializer {
    
    static let instance = AppInitializer()
    
    func appInit(windowScene: UIWindowScene) -> UIWindow {
        let window = UIWindow(windowScene: windowScene)
        
        GlobalRouter.instance.window = window
        GlobalRouter.instance.setMain()
        
        return window
    }
}
