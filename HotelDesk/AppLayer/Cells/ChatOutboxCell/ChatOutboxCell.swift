//
//  ChatOutboxCell.swift
//  HotelDesk
//
//  Created by Александр Катков on 05.10.2022.
//

import Foundation
import UIKit

class ChatOutboxCell: UITableViewCell {
    
    // MARK: Outlets
    
    @IBOutlet weak var outboxMessageLabel: UILabel!
    
    // MARK: Life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func bind(textOutbox: String) {
        outboxMessageLabel.text = textOutbox
    }
}
