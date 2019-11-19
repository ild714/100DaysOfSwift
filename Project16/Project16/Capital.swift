//
//  Capital.swift
//  Project16
//
//  Created by Ильдар Нигметзянов on 11.11.2019.
//  Copyright © 2019 Learning Swift. All rights reserved.
//

import UIKit
import MapKit

class Capital: NSObject,MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String){
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }
}
