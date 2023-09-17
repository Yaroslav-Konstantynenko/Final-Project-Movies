//
//  MainTabBarController.swift
//  FinalProjectMovies
//
//  Created by Yaroslav Konstantynenko on 11.09.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //generateTabBar()
        setTabBarAppearance()
    }
    
//    private func generateTabBar() {
//        viewControllers = [
//            generateVC(
//                viewController: HomeViewController(),
//                title: "Home",
//                image: UIImage(systemName: "house")
//            ),
//            generateVC(
//                viewController: MoviesViewController(),
//                title: "Movies",
//                image: UIImage(systemName: "film")
//            ),
//            generateVC(
//                viewController: TvViewController(),
//                title: "TV",
//                image: UIImage(systemName: "tv")
//            ),
//            generateVC(
//                viewController: SeriesViewController(),
//                title: "Series",
//                image: UIImage(systemName: "popcorn")
//            ),
//            generateVC(
//                viewController: BookmarksViewController(),
//                title: "Bookmarks",
//                image: UIImage(systemName: "bookmark.square")
//            )
//        ]
//    }
//
//    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
//        viewController.tabBarItem.title = title
//        viewController.tabBarItem.image = image
//
//        return viewController
//    }
    
    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 8
        
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height
            ),
            cornerRadius: height / 2
        )
        
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width / 6.5
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.mainTabBarColor.cgColor
        tabBar.tintColor = .tabBarItemAccent
        tabBar.unselectedItemTintColor = .tabBarItemLight
    }
}
