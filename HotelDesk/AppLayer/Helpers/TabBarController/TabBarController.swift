//
//  TabBarController.swift
//  HotelDesk
//
//  Created by Александр Катков on 21.09.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        commonInit()
    }

    override func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {
        fatalError("forbidden @ commonInit")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func commonInit() {
        let items = TabBarItemType.allCases
        
        let controllers = items.map { (type) -> UIViewController in
            let controller: UINavigationController
            controller = NavigationController(rootViewController: TabBarModule(type: type).configure())
            
            let presentation = TabBarPresentation(type: type)
            
            controller.tabBarItem = .init(title: presentation.title,
                                          image: presentation.image,
                                          selectedImage: presentation.selectedImage)
            
            self.tabBar.tintColor = Colors.Dark.ui
            self.tabBar.backgroundColor = Colors.Light.ui
            self.tabBar.barTintColor = Colors.Light.ui
            self.tabBar.isTranslucent = false
    
            return controller
        }
        
        super.setViewControllers(controllers, animated: true)
    }
}
