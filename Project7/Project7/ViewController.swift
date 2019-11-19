//
//  ViewController.swift
//  Project7
//
//  Created by Ильдар Нигметзянов on 26.10.2019.
//  Copyright © 2019 Learning Swift. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var petitions = [Petition]()
    var mas:[Petition] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "credits", style: .plain, target: self, action: #selector(what))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "find",style: .plain,target:self,action: #selector(find))
        
        
        let urlString: String
        
        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
        
        if let url = URL(string: urlString){
            if let data = try? Data(contentsOf: url){
                parse(json: data)
                return
            }
            showError()
        }
    }

    @objc func find() {
        let vc = UIAlertController(title: "What find?", message: nil, preferredStyle: .alert)
        vc.addTextField()
        
        let text = {[weak self, weak vc] (action:UIAlertAction!) in
            
            if let text = vc?.textFields?[0].text{
                
                for i in self!.petitions  {
                    if i.title.contains(text) {
                        self?.mas.append(i)
                        
                        //self?.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
                    }
                }
                
                
            self!.petitions = self!.mas
            self!.tableView.reloadData()
            }
        }
        vc.addAction(UIAlertAction(title: "find", style: .default, handler: text))
        present(vc,animated: true)
    }
    
    @objc func what() {
        let vc = UIAlertController(title: "We The People API of the Whitehouse", message: nil, preferredStyle: .alert)
        vc.addAction(UIAlertAction(title: "OK", style: .default))
        present(vc,animated: true)
    }
    
    func parse(json: Data){
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self,from: json){
            petitions = jsonPetitions.results
            //print(petitions[0])
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

    func showError() {
        let ac = UIAlertController(title:"Loading error",message:"There was a problem loading the feed; please check your connection and try again.",preferredStyle: .alert )
        ac.addAction(UIAlertAction(title: "ok", style: .default))
        present (ac,animated: true )
    }
    
}

