//
//  DetailViewController.swift
//  Homework1
//
//  Created by Ильдар Нигметзянов on 29/08/2019.
//  Copyright © 2019 Nigmetzyanov Ildar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    
    var nameOfImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let downloadImage = nameOfImage else {
            return
        }
        image.image = UIImage(named: downloadImage)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(share))
        
        //image.layer.borderWidth = 1
        // Do any additional setup after loading the view.
    }
    
    @objc func share() {
        guard let downloadImage = image.image?.jpegData(compressionQuality: 1) else {
            return
        }
        
        let sh = UIActivityViewController(activityItems: [downloadImage], applicationActivities: [])
        present(sh,animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
}
