//
//  ViewController.swift
//  Project1
//
//  Created by Ильдар Нигметзянов on 26/08/2019.
//  Copyright © 2019 Nigmetzyanov Ildar. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    var countMain = Save()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        DispatchQueue.global(qos: .userInitiated).async{
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath:path)
        
        for item in items{
            if item.hasPrefix("nssl"){
                self.pictures.append(item)
                self.countMain.count.append(0)
            }
        }
        
        self.pictures.sort()
        }
        tableView.reloadData()
        print(pictures)
        
        let defaults = UserDefaults.standard
        if let data = defaults.object(forKey: "test") as? Data {
            let jsonDecoder = JSONDecoder()
            do {
                countMain = try jsonDecoder.decode(Save.self,from:data)
            } catch {
                print ("error")
            }
        }
        
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture",for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.number = String(indexPath.row + 1)
            vc.allNumber = String(pictures.count)
            countMain.count[indexPath.row] += 1
            vc.times = countMain.count[indexPath.row]
            save()
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func save() {
        let coder = JSONEncoder()
        if let savedData = try? coder.encode(countMain){
            let defaults = UserDefaults.standard
            defaults.set(savedData, forKey: "test")
        } else {
            print ("error")
        }
        
    }
}

