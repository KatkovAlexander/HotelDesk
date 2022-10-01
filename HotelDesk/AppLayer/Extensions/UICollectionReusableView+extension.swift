//
//  UICollectionReusableView+extension.swift
//  HotelDesk
//
//  Created by Александр Катков on 25.09.2022.
//

import UIKit

extension UICollectionReusableView {
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
