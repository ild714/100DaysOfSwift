//
//  Save.swift
//  Project2
//
//  Created by Ильдар Нигметзянов on 09.11.2019.
//  Copyright © 2019 Nigmetzyanov Ildar. All rights reserved.
//

import UIKit

class Save: NSObject,Codable {
    var score : Int!
    
    init(score: Int = 0){
        self.score = score
    }
}
