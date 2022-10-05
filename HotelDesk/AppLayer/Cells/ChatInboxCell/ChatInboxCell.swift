//
//  ChatInboxCell.swift
//  HotelDesk
//
//  Created by Александр Катков on 02.10.2022.
//

import Foundation
import UIKit

class ChatInboxCell: UITableViewCell {
    
    // MARK: Outlets
    
    @IBOutlet private weak var inboxMessageLabel: UILabel!
    
    // MARK: Life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func bind(textInbox: String) {
        inboxMessageLabel.text = textInbox
    }
}
