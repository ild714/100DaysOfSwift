//
//  Person.swift
//  Project10
//
//  Created by Ильдар Нигметзянов on 04.11.2019.
//  Copyright © 2019 Learning Swift. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String,image: String){
        self.name = name
        self.image = image
    }
}
