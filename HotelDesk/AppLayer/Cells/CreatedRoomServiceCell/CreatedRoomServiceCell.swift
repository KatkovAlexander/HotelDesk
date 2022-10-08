//
//  CreatedRoomServiceCell.swift
//  HotelDesk
//
//  Created by Александр Катков on 07.10.2022.
//

import Foundation
import UIKit

class CreatedRoomServiceCell: UITableViewCell {
    
    weak var delegate: CreatedRoomServiceCellDelegate?
    
    private var serviceId: Int?
    
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
        guard let serviceId = serviceId else {
            return
        }
        
        delegate?.didTapDeleteCreatedServiceCell(serviceId: serviceId)
    }
    
    func bind(model: CreatedRoomServiceCellModel) {
        self.serviceId = model.serviceId
        
        titleLabel.text = model.titleText
        subtitleLabel.text = model.subtitleText
    }
}
