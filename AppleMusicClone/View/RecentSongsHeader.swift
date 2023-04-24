//
//  RecentSongsHeader.swift
//  AppleMusicClone
//
//  Created by Vladimir Kovalev on 24.04.2023.
//

import UIKit

private let reuseIdentifier = "OptionCell"

class RecentSongHeader: UICollectionReusableView {
    //MARK: - Properties
    
    private var tableView = UITableView()
    

    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
        

        
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func configureTableView() {
        tableView.register(OptionCell.self, forCellReuseIdentifier: "OptionCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .lightGray
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        tableView.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: self.frame.height).isActive = true
    }
    
}

extension RecentSongHeader: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OptionCell", for: indexPath) as! OptionCell
        cell.backgroundColor = .black
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height: CGFloat = self.frame.height / 6
        return height
    }
}


