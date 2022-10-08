//
//  NibLoadable.swift
//  HotelDesk
//
//  Created by Александр Катков on 08.10.2022.
//

import Foundation
import UIKit

protocol NibLoadable {
    
    static var nibName: String { get }
    
    static func loadNib() -> UINib?
    
    static func createFromNib() -> Self
}

extension NibLoadable where Self: UIView {
    
    static var nibName: String {
        return String(describing: self)
    }
    
    static func loadNib() -> UINib? {
        return UINib(nibName: Self.nibName, bundle: nil)
    }
    
    static func createFromNib() -> Self {
        guard let view = loadNib()?.instantiate(withOwner: nil, options: nil).last as? Self else {
            fatalError("RIP")
        }
        return view
    }
}
