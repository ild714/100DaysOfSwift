//
//  ViewController.swift
//  Challenge5
//
//  Created by Ильдар Нигметзянов on 10.11.2019.
//  Copyright © 2019 Learning Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let tableView = UITableView()
    //var countries = [String]()
    
    var petitions = [Petition]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.frame
        
        view.backgroundColor = .green
        
        view.addSubview(tableView)
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.name)
        
        let urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url){
                parse(json: data)
            }
        }
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            tableView.reloadData()
        }
    }
}



extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.name, for: indexPath) as! TableViewCell
        
        cell.label.text = petitions[indexPath.row].title
        
        return cell
    }
    
    
}
