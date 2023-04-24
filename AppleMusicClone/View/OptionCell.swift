//
//  OptionCell.swift
//  AppleMusicClone
//
//  Created by Vladimir Kovalev on 24.04.2023.
//

import UIKit

class OptionCell: UITableViewCell {
    //MARK: - Proeprties
    
   private let optionImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "music.note.list")
        iv.tintColor = .red
        return iv
    }()
    
   private let optionName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24)
       label.text = "Playlists"
        return label
    }()
    
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(optionImage)
        optionImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 2).isActive = true
        optionImage.heightAnchor.constraint(equalToConstant: self.frame.width / 3 - 4).isActive = true
        optionImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        addSubview(optionName)
        optionName.leftAnchor.constraint(equalTo: optionImage.rightAnchor, constant: 6).isActive = true
        optionName.centerYAnchor.constraint(equalTo: optionImage.centerYAnchor, constant: 0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
