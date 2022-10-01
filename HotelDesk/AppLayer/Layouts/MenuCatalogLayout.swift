//
//  MenuCatalogLayout.swift
//  HotelDesk
//
//  Created by Александр Катков on 25.09.2022.
//

import UIKit

struct MenuCatalogLayout: SectionLayoutable {

    var background: UICollectionReusableView.Type?

    var section: NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalWidth(0.66))

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitem: item,
                                                       count: 2)
        group.interItemSpacing = .fixed(8)
        group.contentInsets.leading = 16
        group.contentInsets.trailing = 16

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 32, leading: 0, bottom: 100, trailing: 0) // тут от корзины ваще должно зависеть
        section.interGroupSpacing = 12

        return section
    }

    var header: NSCollectionLayoutBoundarySupplementaryItem? {
        return nil
    }

    var footer: NSCollectionLayoutBoundarySupplementaryItem? {
        return nil
    }
}
