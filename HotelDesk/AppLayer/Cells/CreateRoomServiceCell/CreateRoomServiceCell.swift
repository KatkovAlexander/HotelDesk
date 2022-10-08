//
//  CreateRoomServiceCell.swift
//  HotelDesk
//
//  Created by Александр Катков on 08.10.2022.
//

import Foundation
import UIKit

class CreateRoomServiceCell: UITableViewCell {
    
    weak var delegate: CreateRoomServiceCellDelegate?
    
    // MARK: Outlets
    
    @IBOutlet private weak var titleView: DesignableView! {
        didSet {
            titleView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                  action: #selector(didTapCategory)))
        }
    }
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleView: DesignableView! {
        didSet {
            subtitleView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                     action: #selector(didTapSubcategory)))
        }
    }
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var selectView: DesignableView! {
        didSet {
            selectView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                   action: #selector(didTapSelect)))
        }
    }
    @IBOutlet private weak var deleteImageView: UIImageView! {
        didSet {
            deleteImageView.isUserInteractionEnabled = true
            deleteImageView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                        action: #selector(didTapDelete)))
        }
    }
    
    // MARK: Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    // MARK: Action
    
    @objc private func didTapSelect() {
        guard let title = titleLabel.text, let subtitle = subtitleLabel.text else {
            return
        }
        
        delegate?.didTapSelect(title: title, subtitle: subtitle)
    }
    
    @objc private func didTapDelete() {
        delegate?.didTapDeleteServieceCell()
    }
    
    @objc private func didTapCategory() {
        delegate?.didSelectLabel(type: .category)
    }
    
    @objc private func didTapSubcategory() {
        delegate?.didSelectLabel(type: .subcategory)
    }
    
    // MARK: Public func
    
    func bind(model: CreateRoomServiceCellModel) {
        titleLabel.text = model.categoryText ?? "Выберите категорию"
        titleLabel.alpha = model.categoryText == nil ? 0.5 : 1
        
        subtitleLabel.text = model.subcategoryText ?? "Выберите подкатегорию"
        subtitleLabel.isUserInteractionEnabled = model.categoryText != nil
        subtitleLabel.alpha = model.subcategoryText == nil ? 0.5 : 1
        
        selectView.isUserInteractionEnabled = model.categoryText != nil && model.subcategoryText != nil
        selectView.alpha = model.subcategoryText == nil ? 0.5 : 1
    }
}
