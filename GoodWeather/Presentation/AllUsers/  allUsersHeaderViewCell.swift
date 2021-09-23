//
//    allUsersHeaderViewCell.swift
//  GoodFriends
//
//  Created by Nika Reshanova on 25.08.2021.
//

import UIKit


class allUsersHeaderViewCell: UITableViewHeaderFooterView {
    
    static let identifier = "allUsersHeaderViewCell"
    
    private var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.backgroundColor = #colorLiteral(red: 0.550610169, green: 0.7370476955, blue: 0.7549899386, alpha: 1)
                return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.configureStatic()
    }
    
    
    func configure(_ text: String?){
        label.text = text
        
        
    }
    
    private func setupViews() {
        addSubview(label)
        
        NSLayoutConstraint.activate([
//            label.topAnchor.constraint(equalTo: contentView.topAnchor),
//            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            label.heightAnchor.constraint(equalToConstant: 20),
//            label.widthAnchor.constraint(equalToConstant: 60),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
            
        ])
      
       
    }
    private func configureStatic() {
        contentView.backgroundColor = #colorLiteral(red: 0.550610169, green: 0.7370476955, blue: 0.7549899386, alpha: 1)
        contentView.alpha = 0.3
        }
    
    }
    

