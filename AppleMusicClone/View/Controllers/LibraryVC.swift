//
//  LibraryVC.swift
//  AppleMusicClone
//
//  Created by Vladimir Kovalev on 25.04.2023.
//

import UIKit

private let reuseIdentfier = "RecentSongCell"
private let headerReuseIdentifier = "RecentSongsHeader"

class LibraryVC: UICollectionViewController {
    //MARK: - Properties
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureCollectionView()
        configureNavController()
    }
    
    //MARK: - Helpers
    
    func configureNavController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Library"
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editSelection))
        navigationItem.rightBarButtonItem?.tintColor = .red
        let regularBarButtonTextAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 20)
        ]
        navigationItem.rightBarButtonItem?.setTitleTextAttributes(regularBarButtonTextAttributes, for: .normal)
        navigationItem.rightBarButtonItem?.setTitleTextAttributes(regularBarButtonTextAttributes, for: .highlighted)
    }
    
    func configureCollectionView() {
        collectionView.backgroundColor = .black
        
        collectionView.register(RecentSongCell.self, forCellWithReuseIdentifier: reuseIdentfier)
        collectionView.register(RecentSongHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)
    }
    
    //MARK: - UICollectionViewDelegate & DataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentfier, for: indexPath) as! RecentSongCell
        cell.layer.cornerRadius = 10
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerReuseIdentifier, for: indexPath) as! RecentSongHeader
        header.backgroundColor = .black
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc =  SongVC()
        vc.modalPresentationStyle = .pageSheet
        present(vc, animated: true)
    }
    
    //MARK: - Selectors
    
   @objc func editSelection() {
        print("Edit")
    }
    
}

extension LibraryVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 175, height: 220)
        return size
    }
    
   

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let space: CGFloat = 15
        return space
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 450)
    }

}

