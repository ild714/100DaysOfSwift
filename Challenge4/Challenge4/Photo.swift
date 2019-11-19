//
//  Photo.swift
//  Challenge4
//
//  Created by Ильдар Нигметзянов on 09.11.2019.
//  Copyright © 2019 Learning Swift. All rights reserved.
//

import UIKit

class Photo: NSObject,Codable {
    var image: String
    var name: String
    
    init (image: String,name: String){
        self.image = image
        self.name = name
    }
}
