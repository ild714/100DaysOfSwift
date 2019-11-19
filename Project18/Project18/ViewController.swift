//
//  ViewController.swift
//  Project18
//
//  Created by Ильдар Нигметзянов on 17.11.2019.
//  Copyright © 2019 Learning Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print ("I'm inside the viewDidLoad() method.")
//        print (1,2,3,4,5,separator: "-")
//        print(1,2,3,terminator:"1")
//
        
//        assert(1 == 1,"Maths failure!")
//        assert(1 == 2,"Maths failure!")
        
        for i in 1...100 {
            print ("Got number \(i).")
        }
    }


}

