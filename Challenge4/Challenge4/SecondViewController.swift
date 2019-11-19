//
//  SecondViewController.swift
//  Challenge4
//
//  Created by Ильдар Нигметзянов on 09.11.2019.
//  Copyright © 2019 Learning Swift. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var name = String()
    var photo = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        //title = name
        let ph = photo
        ph.frame = view.frame
        
        view.addSubview(photo)
    }
    

    

}
