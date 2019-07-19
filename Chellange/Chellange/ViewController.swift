//
//  ViewController.swift
//  Chellange
//
//  Created by Ильдар Нигметзянов on 19/07/2019.
//  Copyright © 2019 Learning with Swift. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var picturesFlag = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let fl = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fl.contentsOfDirectory(atPath: path)
        
            for item in items {
                if item.contains("png") {
                picturesFlag.append(item)
                }
            }
        
        print (picturesFlag)
        
        title = "Flags"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return picturesFlag.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture",for: indexPath)
        cell.textLabel?.text = picturesFlag[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
        
        vc.nameOfImage = picturesFlag[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    /*
   override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool){
        super.viewDidDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false 
        
    }
 */
}


