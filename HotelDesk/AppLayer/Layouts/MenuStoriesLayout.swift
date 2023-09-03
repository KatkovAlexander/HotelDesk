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
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(200),
                                              heightDimension: .estimated(120))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(200),
                                               heightDimension: .estimated(120))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                     subitem: item,
                                                     count: 1)
        group.edgeSpacing = NSCollectionLayoutEdgeSpacing(
            leading: .fixed(5),
            top: .fixed(5),
            trailing: .fixed(0),
            bottom: .fixed(5)
        )

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.top = 12
        section.contentInsets.leading = 12
        section.contentInsets.trailing = 100
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
