//
//  GlobalRouter.swift
//  HotelDesk
//
//  Created by Александр Катков on 21.09.2022.
//

import UIKit

class GlobalRouter {
    
    static let instance = GlobalRouter()
    
    weak var window: UIWindow?
    
    func setLogin() {
        let module = LoginConfigurator().configure()
        let navigation = NavigationController(rootViewController: module)
        
//        navigation.navigationBar.tintColor = Colors.Light.ui
        navigation.navigationBar.shadowImage = UIImage()
        navigation.navigationBar.layer.shadowOffset = .init(width: 0, height: -10)
        
//
//        let appearance = UINavigationBarAppearance()
//        appearance.configureWithTransparentBackground()
//
//        navigation.navigationBar.compactAppearance = appearance
//        navigation.navigationBar.standardAppearance = appearance
//        navigation.navigationBar.scrollEdgeAppearance = appearance
        
        window?.setRoot(navigation)
    }
    
    func setMain() {
        window?.setRoot(TabBarController(nibName: nil, bundle: nil))
    }
}

