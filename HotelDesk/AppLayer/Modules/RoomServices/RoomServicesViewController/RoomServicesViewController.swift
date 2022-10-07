//
//  RoomServicesViewController.swift
//  HotelDesk
//
//  Created by Александр Катков on 07.10.2022.
//  
//

import UIKit

class RoomServicesViewController: UIViewController {
    
    var output: RoomServicesViewControllerOutput!

    // MARK: Outlets
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.separatorStyle = .none
            tableView.dataSource = self
            tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        }
    }
    
    @IBOutlet private weak var makeOrderView: DesignableView! {
        didSet {
            makeOrderView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                      action: #selector(didTapMakeOrder)))
        }
    }
    
    // MARK: Private properties
    
    var models: [RoomServicesTableViewCellType] = []
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCell()
        
        output.viewDidLoad()
    }
    
    // MARK: Private func
    
    private func registerCell() {
        tableView.register(UINib(nibName: String(describing: CreatedRoomServieceCell.self), bundle: nil),
                           forCellReuseIdentifier: String(describing: CreatedRoomServieceCell.self))
        tableView.register(UINib(nibName: String(describing: AddRoomServieceCell.self), bundle: nil),
                           forCellReuseIdentifier: String(describing: AddRoomServieceCell.self))
        tableView.register(UINib(nibName: String(describing: CreateRoomServieceCell.self), bundle: nil),
                           forCellReuseIdentifier: String(describing: CreateRoomServieceCell.self))
    }
    
    // MARK: Action
    
    @objc private func didTapMakeOrder() {
        output.didTapMakeOrder()
    }
    
}

// MARK: extension - RoomServicesPresenterToViewProtocol

extension RoomServicesViewController: RoomServicesViewControllerInput {
    
    func initialState(title: String) {
        navigationItem.title = title
    }
    
    func updateModel(models: [RoomServicesTableViewCellType]) {
        self.models = models
        
        DispatchQueue.main.async { self.tableView.reloadData() }
    }
    
    func isMakeOrderButtonAvailable(available: Bool) {
        makeOrderView.isUserInteractionEnabled = available
        makeOrderView.alpha = available ? 1 : 0.5
    }
}

extension RoomServicesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = models[indexPath.row]
        
        switch type {
        case .created(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CreatedRoomServieceCell.self), for: indexPath) as? CreatedRoomServieceCell else {
                return UITableViewCell(style: .default, reuseIdentifier: nil)
            }

            cell.bind(model: model)
            cell.delegate = output
            
            return cell
        case .add:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AddRoomServieceCell.self), for: indexPath) as? AddRoomServieceCell else {
                return UITableViewCell(style: .default, reuseIdentifier: nil)
            }
            
            cell.delegate = output
            
            return cell
        case .create(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CreateRoomServieceCell.self), for: indexPath) as? CreateRoomServieceCell else {
                return UITableViewCell(style: .default, reuseIdentifier: nil)
            }
            
            cell.bind(model: .init(categoryText: model.categoryText, subcategoryText:model.subcategoryText))
            cell.delegate = output
            
            return cell
        }
    }
}
