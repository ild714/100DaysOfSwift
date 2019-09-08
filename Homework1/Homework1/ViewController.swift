//
//  ViewController.swift
//  Homework1
//
//  Created by Ильдар Нигметзянов on 29/08/2019.
//  Copyright © 2019 Nigmetzyanov Ildar. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var flags = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //flags += ["estonia","france","germany","ireland","italy","monaco","nigeria","poland","russia","spain","uk","us"]
        
        let fm = FileManager.default
        let bn = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: bn)
        for item in items {
            if item.hasSuffix("png") {
                flags.append(item)
            }
        }
        print (flags)
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView   .dequeueReusableCell(withIdentifier:"Flag",for:indexPath)
        cell.imageView?.image = UIImage(named: flags[indexPath.row])
        cell.textLabel?.text = flags[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.nameOfImage = flags[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
}

