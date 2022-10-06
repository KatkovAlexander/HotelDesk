//
//  MenuStoriesLayout.swift
//  HotelDesk
//
//  Created by Александр Катков on 25.09.2022.
//

import UIKit

struct StoriesLayout: SectionLayoutable {
    
    var background: UICollectionReusableView.Type?

    var section: NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.6),
                                               heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                     subitem: item,
                                                     count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(
            top: 5,
            leading: 4,
            bottom: 5,
            trailing: 5)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.top = 12
        section.contentInsets.leading = 12
        section.contentInsets.trailing = 150
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }

    var header: NSCollectionLayoutBoundarySupplementaryItem? {
        return nil
    }

    var footer: NSCollectionLayoutBoundarySupplementaryItem? {
        return nil
    }
}
