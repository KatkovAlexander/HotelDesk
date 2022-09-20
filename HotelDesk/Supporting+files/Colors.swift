//
//  Colors.swift
//  HotelDesk
//
//  Created by Александр Катков on 21.09.2022.
//

import UIKit

enum Colors: String {
    
    case Dark
    
    case Light
    
    var ui: UIColor {
        return UIColor(named: rawValue) ?? .blue
    }
}
