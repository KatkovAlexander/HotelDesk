//
//  NavigationController.swift
//  HotelDesk
//
//  Created by Александр Катков on 21.09.2022.
//

import UIKit

extension CALayer {

    func applyNavBarShadow() {
        shadowRadius = 8
        shadowOffset = .init(width: 0, height: 4)
        shadowColor = UIColor.black.cgColor
        shadowOpacity = 0.05
    }
}

class NavigationController: UINavigationController {
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)

        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        commonInit()
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        commonInit()
    }

    private func commonInit() {
        applyShadow()
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = Colors.Light.ui
        
        appearance.titleTextAttributes = [.foregroundColor: Colors.Dark.ui]
        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.tintColor = Colors.Dark.ui
        navigationBar.barTintColor = Colors.Light.ui
        
    }
    
    private func applyShadow() {
        navigationBar.shadowImage = UIImage()

        navigationBar.layer.applyNavBarShadow()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        viewControllers.last?.navigationItem.backBarButtonItem = backButton
        super.pushViewController(viewController, animated: animated)
    }
}
