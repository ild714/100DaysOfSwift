//
//  TableViewCell.swift
//  Challenge4
//
//  Created by Ильдар Нигметзянов on 09.11.2019.
//  Copyright © 2019 Learning Swift. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    public static let name: String = "cell"
    public var namePhoto = UILabel()
    public var photo = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        namePhoto.frame = self.contentView.frame
        namePhoto.frame = CGRect(x: 10, y: 10, width: 40, height: 20)
        //let image = UIImageView(image: UIImage(named: "first"))
        //let photo = UIImageView(image: UIImage(named: photo))
        photo.frame = CGRect(x: 130, y: 0, width: 100, height: 100)
        
        
        contentView.addSubview(namePhoto)
        contentView.addSubview(photo)
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
