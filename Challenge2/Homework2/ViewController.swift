//
//  ViewController.swift
//  Homework2
//
//  Created by Ильдар Нигметзянов on 26.10.2019.
//  Copyright © 2019 Learning Swift. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var purcheses: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "add", style: .plain, target: self, action: #selector(add))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "clean", style: .plain, target: self, action: #selector(clean))
    }
    
    @objc func clean() {
        purcheses.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    @objc func add() {
        let vc = UIAlertController(title: "Purcheses", message: nil, preferredStyle: .alert)
        vc.addTextField()
        
        let text = {[weak self,weak vc] (action: UIAlertAction!) in
            if let text = vc?.textFields?[0].text {
                self?.purcheses.insert(text, at: 0)
                self?.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
            }
        }
        
        vc.addAction(UIAlertAction(title: "share", style: .default, handler: share))
        vc.addAction(UIAlertAction(title: "dd", style: .default, handler: text))
        
        present(vc,animated: true)
    }
    
    func share(action: UIAlertAction!) {
        let list =  purcheses.joined(separator: "\n")
        let share = UIActivityViewController(activityItems: [list], applicationActivities: nil)
        present(share,animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return purcheses.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = purcheses[indexPath.row]
        return cell
        
    }
    
    
    
}

