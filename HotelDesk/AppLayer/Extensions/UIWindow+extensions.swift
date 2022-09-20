//
//  UIWindow+extensions.swift
//  HotelDesk
//
//  Created by Александр Катков on 21.09.2022.
//

import UIKit

extension UIWindow {

    func setRoot(_ root: UIViewController) {
        rootViewController = root
        makeKeyAndVisible()
    }
}

