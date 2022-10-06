//
//  MenuViewControllerOutput.swift
//  HotelDesk
//
//  Created by Александр Катков on 21.09.2022.
//  
//


import Foundation

protocol MenuViewControllerOutput: AnyObject, CategoryCellDelegate {
    
    var models: [MenuSectionModel] { get }
    
    func viewDidLoad()
}
