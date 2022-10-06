//
//  MenuViewController.swift
//  HotelDesk
//
//  Created by Александр Катков on 21.09.2022.
//  
//

import UIKit
import simd

class MenuViewController: UIViewController {
    
    var output: MenuViewControllerOutput!
    
    private let storiesLayout = StoriesLayout()
    private let catalogLayout = MenuCatalogLayout()
    
    private var sections: [MenuSectionModel] = []
    private var dataSource: UICollectionViewDiffableDataSource<MenuSectionModel, AnyHashable>?
    
    // MARK: Outlets
    
    @IBOutlet fileprivate weak var collectionView: UICollectionView!  {
        didSet {
            collectionView.showsVerticalScrollIndicator = false
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.collectionViewLayout = generateLayout()
            collectionView.backgroundColor = Colors.Light.ui
        }
    }
        
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
        createDataSource()
        output.viewDidLoad()
    }
        
    private func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, _) -> NSCollectionLayoutSection? in
            let sectionLayoutKind = self.sections[sectionIndex].type

            switch sectionLayoutKind {
            case .storyCell:
                return self.storiesLayout.buildSectionLayout()
            case .categoryCell:
                return self.catalogLayout.buildSectionLayout()
            }
        }

        return layout
    }
    
    private func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<MenuSectionModel, AnyHashable>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, data) -> UICollectionViewCell? in
            switch self.sections[indexPath.section].type {
                
            case .storyCell:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: StoryCell.self), for: indexPath) as? StoryCell,
                      let data = data as? StoryCellModel
                else {
                    return UICollectionViewCell()
                }

                cell.bind(data)
                return cell
            case .categoryCell:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CategoryCell.self), for: indexPath) as? CategoryCell,
                      let data = data as? CategoryCellModel
                else {
                    return UICollectionViewCell()
                }

                cell.bind(data)
                cell.delegate = self.output
                
                return cell
            }
        })
    }
    
    private func registerCells() {
        collectionView.register(StoryCell.self,
                                forCellWithReuseIdentifier: String(describing: StoryCell.self))
        collectionView.register(CategoryCell.self,
                                forCellWithReuseIdentifier: String(describing: CategoryCell.self))
    }
}

// MARK: Extension - MenuPresenterToViewProtocol

extension MenuViewController: MenuViewControllerInput {

    func initialSetup(title: String) {
        navigationItem.title = title
    }
    
    func updateCollection(sections: [MenuSectionModel]) {
        self.sections = sections
        
        var snapshot = NSDiffableDataSourceSnapshot<MenuSectionModel, AnyHashable>()
        snapshot.appendSections(sections)
        
        for section in sections {
            snapshot.appendItems(section.items, toSection: section)
        }
        
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
}
