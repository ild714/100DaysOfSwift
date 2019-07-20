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

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(playTapped))
        if let im = nameOfImage {
            image.image = UIImage(named: im)
        
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
    
    @objc func playTapped() {
        guard let image = image.image?.jpegData(compressionQuality: 1) else  {
            return
        }
        

        let vc = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present (vc,animated: true)
    }
    
    
}
