//
//  DetailViewController.swift
//  Chellange
//
//  Created by Ильдар Нигметзянов on 19/07/2019.
//  Copyright © 2019 Learning with Swift. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    var nameOfImage : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(playTapped))
        if let im = nameOfImage {
            image.image = UIImage(named: im)
        
        }
        
}
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func playTapped() {
        guard let tx = nameOfImage else  {
            return
        }
        

        
        let vc = UIActivityViewController(activityItems: [tx], applicationActivities: nil)
        present (vc,animated: true)
    }
    
    
}
