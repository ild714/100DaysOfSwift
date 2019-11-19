//
//  Save.swift
//  Project5
//
//  Created by Ильдар Нигметзянов on 09.11.2019.
//  Copyright © 2019 Nigmetzyanov Ildar. All rights reserved.
//

import UIKit

class Save: NSObject,Codable {
    var title : String!
    var words : [String]!
    
    init(title: String = "", words: [String] = [String]()){
        self.title = title
        self.words = words
    }
}
