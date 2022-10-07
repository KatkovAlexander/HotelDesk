//
//  RoomServiecePickerViewController.swift
//  HotelDesk
//
//  Created by Александр Катков on 08.10.2022.
//  
//

import UIKit
import PanModal

class RoomServiecePickerViewController: UIViewController {
    
    weak var delegate: RoomServiecePickerDelegate?
    var type: CreateRoomServieceCellSelectedLabelType?
    
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
    
    private var selectedIndex: Int = 1
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPicker()
    }
    
    private func setupPicker() {
        for _ in 0..<10 {
            titlesForRows.append(Mock.smallString)
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

extension RoomServiecePickerViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedIndex = row
    }
}

// MARK: extension - UIPickerViewDataSource

extension RoomServiecePickerViewController: UIPickerViewDataSource {
    
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

extension RoomServiecePickerViewController: PanModalPresentable {
    
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
