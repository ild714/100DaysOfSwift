//
//  ViewController.swift
//  test2
//
//  Created by Ильдар Нигметзянов on 02/09/2019.
//  Copyright © 2019 Nigmetzyanov Ildar. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
     var websites = ["apple.com","hackingwithswift.com","google.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = websites[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "web") as? web {
            vc.text = websites[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }
}

