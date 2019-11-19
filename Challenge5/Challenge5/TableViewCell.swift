//
//  TableViewCell.swift
//  Challenge5
//
//  Created by Ильдар Нигметзянов on 10.11.2019.
//  Copyright © 2019 Learning Swift. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    public static let name = "test"
    let label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        label.text = "text"
        label.frame = self.contentView.frame
        label.translatesAutoresizingMaskIntoConstraints = false
//
//        label.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 12).isActive = true
//        label.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -24).isActive = true
//        label.topAnchor.constraint(equalTo: self.contentView.topAnchor,constant: 10).isActive = true
//        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
//

        //label.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12.0).isActive = true
        //label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        //label.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12).isActive = true
        //label.rightAnchor.constraint(equalTo: otherViewToTheSide.rightAnchor, constant: -24).isActive = true
        
        contentView.addSubview(label)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
