//
//  BrowseVC.swift
//  AppleMusicClone
//
//  Created by Vladimir Kovalev on 25.04.2023.
//

import UIKit

class BrowseVC: UIViewController {
    //MARK: - Properties
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNav()
    }
    
    //MARK: - Helpers
    
    func configureNav() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Listen Now"
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
    }
}

