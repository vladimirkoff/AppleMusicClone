//
//  InitialTabBarVC.swift
//  AppleMusicClone
//
//  Created by Vladimir Kovalev on 25.04.2023.
//

import UIKit

class InitialTabController: UITabBarController {
    
    //MARK: - Properties
    
    var scene: UIScene?
    
    //MARK: - Lifecycle
    
    init(scene: UIScene) {
        self.scene = scene
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.selectedIndex = 3
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
    }
    
    //MARK: - Helpers
    
    func configureVC() {
        
        let libraryVC = LibraryVC(collectionViewLayout: UICollectionViewFlowLayout())
        let library = templateNavController(image: UIImage(systemName: "music.note.house.fill")!, rootVC: libraryVC)
        
        let exploreVC = ExploreVC()
        let explore = templateNavController(image: UIImage(systemName: "play.circle.fill")!, rootVC: exploreVC)
        
        let browseVC = BrowseVC()
        let browse = templateNavController(image: UIImage(systemName: "square.grid.2x2.fill")!, rootVC: browseVC)
        
        let radioVC = RadioVC()
        let radio = templateNavController(image: UIImage(systemName: "dot.radiowaves.left.and.right")!, rootVC: radioVC)
        
        let searchVC = SearchVC()
        let search = templateNavController(image: UIImage(systemName: "magnifyingglass")!, rootVC: searchVC)
                        
        
        viewControllers = [explore, browse, radio, library, search]
        
        tabBar.items?[0].title = "Listen now"
        tabBar.items?[1].title = "Browse"
        tabBar.items?[2].title = "Radio"
        tabBar.items?[3].title = "Library"
        tabBar.items?[4].title = "Search"
        
        tabBar.backgroundColor = UIColor(white: -5, alpha: 1)
        tabBar.tintColor = .red
        tabBar.barStyle = .default
        tabBar.inputViewController?.hidesBottomBarWhenPushed = false

        
    }
    
    func templateNavController(image: UIImage, rootVC: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootVC)
        
        let selectedImage = UIImageView(image: image)
        selectedImage.tintColor = .white
        
        nav.tabBarItem.image = image
        nav.tabBarItem.selectedImage = image.withTintColor(UIColor.systemRed)
        nav.tabBarController?.tabBar.backgroundColor = .black
        nav.navigationController?.isNavigationBarHidden = true
        
        return nav
    }
    
}

