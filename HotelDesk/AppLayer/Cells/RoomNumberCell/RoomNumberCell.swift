//
//  RoomNumberCell.swift
//  HotelDesk
//
//  Created by Александр Катков on 08.10.2022.
//

import Foundation
import UIKit

class RoomNumberCell: UITableViewCell {
    
    @IBOutlet private weak var roomNumberLabel: UILabel!
    
    // MARK: Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // MARK: Public func
    
    func bind(roomNumber: String) {
        roomNumberLabel.text = roomNumber
    }
}
