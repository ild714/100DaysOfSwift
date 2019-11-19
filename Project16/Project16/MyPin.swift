//
//  MyPin.swift
//  Project16
//
//  Created by Ильдар Нигметзянов on 11.11.2019.
//  Copyright © 2019 Learning Swift. All rights reserved.
//

import UIKit
import MapKit

class MyPin: MKPinAnnotationView {

    override var pinTintColor: UIColor! {
        get {
            return UIColor.red
        }
        set {
            super.pinTintColor = UIColor.green
        }
    }
    
   
    
}
