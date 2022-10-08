//
//  ProfileTableViewModel.swift
//  HotelDesk
//
//  Created by Александр Катков on 08.10.2022.
//

import Foundation

enum ProfileTableViewCellType {
    
    case profileCell(_ roomNumber: String)
    
    case oneLineCell(_ type: OneLineWithChevronCellType)
}
