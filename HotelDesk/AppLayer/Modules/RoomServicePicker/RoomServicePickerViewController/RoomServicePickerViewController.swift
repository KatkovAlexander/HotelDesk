//
//  RoomServicePickerViewController.swift
//  HotelDesk
//
//  Created by Александр Катков on 08.10.2022.
//  
//

import UIKit
import PanModal

class RoomServicePickerViewController: UIViewController {
    
    weak var delegate: RoomServicePickerDelegate?
    var type: CreateRoomServiceCellSelectedLabelType?
    var selectedCategory: String?
    
    // MARK: Outlets
    
    @IBOutlet private weak var titleLabel: UILabel! {
        didSet {
            guard let type = type else {
                return
            }
            
            switch type {
            case .category:
                titleLabel.text = "Выберите категорию"
            case .subcategory:
                titleLabel.text = "Что конкретно?"
            }
        }
    }
    @IBOutlet private weak var pickerView: UIPickerView! {
        didSet {
            pickerView.delegate = self
            pickerView.dataSource = self
        }
    }
    @IBOutlet private weak var selectView: DesignableView! {
        didSet {
            selectView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                   action: #selector(didTap)))
        }
    }
    
    // MARK: Private properties
    
    private var titlesForRows: [String] = []
    
    private var selectedIndex: Int = 0
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPicker()
    }
    
    private func setupPicker() {
        guard let type = type else {
            return
        }

        switch type {
        case .category:
            titlesForRows.append("Меню подушек")
            titlesForRows.append("Меню ванных принадлежностей")
            titlesForRows.append("Ванный комплект")
            titlesForRows.append("Дополнительно")
        case .subcategory:
            guard let selectedCategory = selectedCategory, let subcategories = Globals.RoomServieceDic[selectedCategory] else {
                return
            }
            
            titlesForRows = subcategories
        }
    }
    
    // MARK: Action
    
    @objc private func didTap() {
        guard let type = type else {
            return
        }

        delegate?.selectedCell(text: titlesForRows[selectedIndex], type: type)
        dismiss(animated: true)
    }
}

// MARK: extension - UIPickerViewDelegate

extension RoomServicePickerViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedIndex = row
    }
}

// MARK: extension - UIPickerViewDataSource

extension RoomServicePickerViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return titlesForRows.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return titlesForRows[row]
    }
}

// MARK: extension - PanModalPresentable

extension RoomServicePickerViewController: PanModalPresentable {
    
    var panScrollable: UIScrollView? {
        return nil
    }
    
    var shortFormHeight: PanModalHeight {
        return .contentHeight(380)
    }
    
    var longFormHeight: PanModalHeight {
        return .contentHeight(380)
    }
    
    var shouldRoundTopCorners: Bool {
        return true
    }
    
    var showDragIndicator: Bool {
        return true
    }
    
    var allowsTapToDismiss: Bool {
        return true
    }
    
    var allowsDragToDismiss: Bool {
        return true
    }
    
    func shouldRespond(to panModalGestureRecognizer: UIPanGestureRecognizer) -> Bool {
        return false
    }
}
