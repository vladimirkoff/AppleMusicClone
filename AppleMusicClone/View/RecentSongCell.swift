//
//  RecentSongCell.swift
//  AppleMusicClone
//
//  Created by Vladimir Kovalev on 24.04.2023.
//

import UIKit

class RecentSongCell: UICollectionViewCell {
    //MARK: - Proeprties
    
   private let songImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .lightGray
        iv.layer.cornerRadius = 10
        iv.clipsToBounds = true
        iv.image = UIImage(named: "flowers")
        return iv
    }()
    
   private let songName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Flowers"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
   private let artistName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Miley Cyrus"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .lightGray
        return label
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        
        
        
        addSubview(songImageView)
        songImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 6).isActive = true
        songImageView.heightAnchor.constraint(equalToConstant: 165).isActive = true
        songImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        songImageView.widthAnchor.constraint(equalToConstant: self.frame.width - 12).isActive = true
        
        
        addSubview(songName)
        songName.topAnchor.constraint(equalTo: songImageView.bottomAnchor, constant: 5).isActive = true
        songName.leftAnchor.constraint(equalTo: songImageView.leftAnchor, constant: 0).isActive = true
        
        addSubview(artistName)
        artistName.leftAnchor.constraint(equalTo: songImageView.leftAnchor, constant: 0).isActive = true
        artistName.topAnchor.constraint(equalTo: songName.bottomAnchor, constant: 1).isActive = true
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
