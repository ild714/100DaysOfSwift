//
//  Save.swift
//  Project1
//
//  Created by Ильдар Нигметзянов on 09.11.2019.
//  Copyright © 2019 Nigmetzyanov Ildar. All rights reserved.
//

import UIKit

class Save: NSObject,Codable {
    var count = [Int]()
    
    init(count: [Int] = [Int]()){
        self.count = count
    }
}
