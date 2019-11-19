//
//  Petition.swift
//  Challenge5
//
//  Created by Ильдар Нигметзянов on 10.11.2019.
//  Copyright © 2019 Learning Swift. All rights reserved.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
