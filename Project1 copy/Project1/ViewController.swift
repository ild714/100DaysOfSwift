//
//  ViewController.swift
//  Project1
//
//  Created by Ильдар Нигметзянов on 26/08/2019.
//  Copyright © 2019 Nigmetzyanov Ildar. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    var pictures = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        DispatchQueue.global(qos: .userInitiated).async{
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath:path)
        
        for item in items{
            if item.hasPrefix("nssl"){
                self.pictures.append(item)
            }
        }
        
        self.pictures.sort()
        }
        DispatchQueue.main.async{
        self.collectionView.reloadData()
        }
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //self.collectionView.reloadData()
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Detail", for: indexPath) as? DetailPrepare else {
            fatalError("error")
        }
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.item]
            vc.number = String(indexPath.row + 1)
            vc.allNumber = String(pictures.count)
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

