//
//  RoomServicesViewControllerInput.swift
//  HotelDesk
//
//  Created by Александр Катков on 07.10.2022.
//  
//


import Foundation

protocol RoomServicesViewControllerInput: AnyObject {

    func initialState(title: String)
    
    func updateModel(models: [RoomServicesTableViewCellType])
    
    func isMakeOrderButtonAvailable(available: Bool)
}
