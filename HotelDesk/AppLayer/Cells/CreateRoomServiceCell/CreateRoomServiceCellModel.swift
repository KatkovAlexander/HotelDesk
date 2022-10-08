//
//  CreateRoomServiceCellModel.swift
//  HotelDesk
//
//  Created by Александр Катков on 08.10.2022.
//

import Foundation

enum CreateRoomServiceCellSelectedLabelType {
    
    case category
    
    case subcategory
}

struct CreateRoomServiceCellModel {
    
    let categoryText: String?
    let subcategoryText: String?
    
    init(categoryText: String? = nil, subcategoryText: String? = nil) {
        self.categoryText = categoryText
        self.subcategoryText = subcategoryText
    }
}
