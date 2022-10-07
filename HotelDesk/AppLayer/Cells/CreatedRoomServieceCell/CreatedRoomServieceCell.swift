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
    
    private var servieceId: Int?
    
    // MARK: Outlets
    
    @IBOutlet private weak var containerView: UIView!
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
    @IBOutlet private weak var deleteImageView: UIImageView! {
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
        guard let servieceId = servieceId else {
            return
        }
        
        delegate?.didTapDeleteCell(servieceId: servieceId)
    }
    
    func bind(model: CreatedRoomServieceCellModel) {
        self.servieceId = model.servieceId
        
        titleLabel.text = model.titleText
        subtitleLabel.text = model.subtitleText
    }
}
