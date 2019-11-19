//
//  DetailViewController.swift
//  Project1
//
//  Created by Ильдар Нигметзянов on 26/08/2019.
//  Copyright © 2019 Nigmetzyanov Ildar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var number: String?
    var allNumber: String?
    var times : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Picture \(number!) of \(allNumber!) | times \(times!)"
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named:imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false 
    }
    
    
}
