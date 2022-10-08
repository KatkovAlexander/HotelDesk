//
//  CreatedRoomServiceCellDelegate.swift
//  HotelDesk
//
//  Created by Александр Катков on 07.10.2022.
//

import Foundation

protocol CreatedRoomServiceCellDelegate: AnyObject {
    
    func didTapDeleteCreatedServiceCell(serviceId: Int)
}
