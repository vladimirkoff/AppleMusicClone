//
//  SearchCell.swift
//  AppleMusicClone
//
//  Created by Vladimir Kovalev on 26.04.2023.
//

import UIKit

class SearchCell: UICollectionViewCell {
    //MARK: - Properties
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.text = "Spatial audio"
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
        
        addSubview(cellImage)
        NSLayoutConstraint.activate([
            cellImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            cellImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            cellImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            cellImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0)
        ])
        
        addSubview(nameLabel)
        nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
