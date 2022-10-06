//
//  CreatedRoomServieceCell.swift
//  HotelDesk
//
//  Created by Александр Катков on 07.10.2022.
//

import Foundation
import UIKit

class CreatedRoomServieceCell: UITableViewCell {
    
    weak var delegate: CreatedRoomServieceCellDelegate?
    
    private var servieceIndex: Int?
    
    // MARK: Outlets
    
    @IBOutlet private weak var containerView: UIView!
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    @IBOutlet weak var deleteImageView: UIImageView! {
        didSet {
            deleteImageView.isUserInteractionEnabled = true
            deleteImageView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                        action: #selector(didTap)))
        }
    }
    // MARK: Life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    override func layoutSubviews() {
        containerView.layer.cornerRadius = 10
    }
    
    @objc private func didTap() {
        guard let servieceIndex = servieceIndex else {
            return
        }
        
        delegate?.didTapDeleteCell(servieceIndex: servieceIndex)
    }
    
    func bind(model: CreatedRoomServieceCellModel) {
        self.servieceIndex = model.servieceIndex
        
        titleLabel.text = model.text
    }
    
    
}
