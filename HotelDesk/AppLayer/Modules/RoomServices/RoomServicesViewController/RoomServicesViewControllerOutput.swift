//
//  RoomServicesViewControllerOutput.swift
//  HotelDesk
//
//  Created by Александр Катков on 07.10.2022.
//  
//


import Foundation

protocol RoomServicesViewControllerOutput: AnyObject, CreatedRoomServieceCellDelegate, AddRoomServieceCellDelegate {
    
    func viewDidLoad()
}
