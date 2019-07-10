//
//  ViewController.swift
//  Project1
//
//  Created by Ильдар Нигметзянов on 10/07/2019.
//  Copyright © 2019 Ildar Nigmetzyanov. All rights reserved.
//

import UIKit // user interface toolkit
//24

class ViewController: UITableViewController { // i want to create a new screen of data
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let fm = FileManager.default // work with filesystem ( look for files )
        let path = Bundle.main.resourcePath! // bundle is a directory that contains our compiled //programm and all our assets
        let items = try! fm.contentsOfDirectory(atPath: path) // items - an array of strings //containing filenames
        
        for item in items {
            if item.hasPrefix("nssl") {
                // this is a picture to load!
                pictures.append(item)
            }
        }
        print (pictures)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
}
