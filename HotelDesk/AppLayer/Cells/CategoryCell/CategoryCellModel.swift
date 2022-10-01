//
//  CategoryCellModel.swift
//  HotelDesk
//
//  Created by Александр Катков on 27.09.2022.
//

import Foundation

struct CategoryCellModel: Hashable, Equatable {
    
    let image: String
    
    var hashValue: Int {
        var hasher = Hasher()
        hasher.combine(image)
        return hasher.finalize()
    }
    
    static func == (lhs: CategoryCellModel, rhs: CategoryCellModel) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
}
