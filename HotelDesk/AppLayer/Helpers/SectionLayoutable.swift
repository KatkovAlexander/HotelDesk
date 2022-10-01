//
//  SectionLayoutable.swift
//  HotelDesk
//
//  Created by Александр Катков on 25.09.2022.
//

import UIKit

protocol SectionLayoutable {

    var section: NSCollectionLayoutSection { get }

    var header: NSCollectionLayoutBoundarySupplementaryItem? { get }

    var footer: NSCollectionLayoutBoundarySupplementaryItem? { get }

    var background: UICollectionReusableView.Type? { get }

    func buildSectionLayout() -> NSCollectionLayoutSection

    init()
}

extension SectionLayoutable {

    func buildSectionLayout() -> NSCollectionLayoutSection {
        let section = section

        var decorationItems: [NSCollectionLayoutDecorationItem] = []

        if let background = background {
            decorationItems.append(NSCollectionLayoutDecorationItem.background(elementKind: background.reuseIdentifier))
        }

        if let header = header {
            section.boundarySupplementaryItems.append(header)
        }

        if let footer = footer {
            section.boundarySupplementaryItems.append(footer)
        }

        section.decorationItems = decorationItems
        return section
    }
}
