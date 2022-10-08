//
//  ProfileViewController.swift
//  HotelDesk
//
//  Created by Александр Катков on 21.09.2022.
//  
//

import UIKit

class ProfileViewController: UIViewController {
    
    var output: ProfileViewControllerOutput!

    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.separatorStyle = .none
            tableView.dataSource = self
            tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        }
    }
    
    // MARK: Private properties
    
    var models: [ProfileTableViewCellType] = []
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCell()
        
        output.viewDidLoad()
    }
    
    private func registerCell() {
        tableView.register(UINib(nibName: String(describing: RoomNumberCell.self), bundle: nil),
                           forCellReuseIdentifier: String(describing: RoomNumberCell.self))
        tableView.register(UINib(nibName: String(describing: OneLineWithChevronCell.self), bundle: nil),
                           forCellReuseIdentifier: String(describing: OneLineWithChevronCell.self))
    }
}

// MARK: Extension - ProfilePresenterToViewProtocol 
extension ProfileViewController: ProfileViewControllerInput {
    
    func initialSetup(title: String) {
        navigationItem.title = title
    }
    
    func updateModel(models: [ProfileTableViewCellType]) {
        self.models = models
        
        DispatchQueue.main.async { self.tableView.reloadData() }
    }
}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let type = models[indexPath.row]
        
        switch type {
        case .profileCell(let roomNumber):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RoomNumberCell.self), for: indexPath) as? RoomNumberCell else {
                return UITableViewCell(style: .default, reuseIdentifier: nil)
            }
            cell.bind(roomNumber: roomNumber)
            return cell
        case .oneLineCell(let type):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: OneLineWithChevronCell.self), for: indexPath) as? OneLineWithChevronCell else {
                return UITableViewCell(style: .default, reuseIdentifier: nil)
            }
            cell.bind(type: type)
            cell.delegate = output
            return cell
        }
    }
}
