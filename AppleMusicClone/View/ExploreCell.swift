//
//  ExploreCell.swift
//  AppleMusicClone
//
//  Created by Vladimir Kovalev on 27.04.2023.
//

import UIKit

private let reuseIdentifier = "SearchCell"

class ExploreCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as! SearchCell
        return cell
    }
    
    //MARK: - Properties
    
    lazy var collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height), collectionViewLayout: UICollectionViewFlowLayout())
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.text = "Top Picks"
        return label
    }()
    
    var cellImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 10
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "hits")
        return iv
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //        addSubview(cellImage)
        //        NSLayoutConstraint.activate([
        //            cellImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
        //            cellImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
        //            cellImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
        //            cellImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0)
        //        ])
        
        //        addSubview(nameLabel)
        //        nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        //        nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12).isActive = true
        
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.register(SearchCell.self, forCellWithReuseIdentifier: "SearchCell")
        //        collectionView.register(SearchVCHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ExploreCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: self.frame.width - 200, height: self.frame.height)
        return size
    }
    
}
