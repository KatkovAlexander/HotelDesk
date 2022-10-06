//
//  AddRoomServieceCell.swift
//  HotelDesk
//
//  Created by Александр Катков on 07.10.2022.
//

import Foundation
import UIKit

class AddRoomServieceCell: UITableViewCell {
    
    weak var delegate: AddRoomServieceCellDelegate?
    
    // MARK: Outlets
    
    @IBOutlet private weak var containerView: UIView!
    
    // MARK: Life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
        addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                    action: #selector(didTap)))
    }
    
    override func layoutSubviews() {
        containerView.layer.cornerRadius = 10
//        containerView.frame.height / 2
    }
    
    @objc private func didTap() {
        delegate?.didTapAddRoomService()
    }
}
