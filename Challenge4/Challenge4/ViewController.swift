//
//  ViewController.swift
//  Challenge4
//
//  Created by Ильдар Нигметзянов on 09.11.2019.
//  Copyright © 2019 Learning Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let tableView = UITableView()
    var pictures = [Photo]()
    //var names = ["test"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.frame
        
        
        view.addSubview(tableView)
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.name)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(choosePhoto))
        
        let defaults = UserDefaults.standard
        
        if let data = defaults.object(forKey: "test") as? Data {
            do {
                let decoder = JSONDecoder()
                pictures = try decoder.decode([Photo].self, from: data)
            } catch {
                print("error")
            }
        }
    }
    
    @objc func choosePhoto() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker,animated: true)
    }
    
    func save() {
        let defaults = UserDefaults.standard
        let coder = JSONEncoder()
        
        if let data = try? coder.encode(pictures) {
            defaults.set(data, forKey: "test")
        } else {
            print ("error")
        }
        
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = SecondViewController()
        
        let picture = pictures[indexPath.row]
        let path = getDocumentDirectory().appendingPathComponent(picture.image)
        vc.photo.image = UIImage(named: path.path)
        vc.name = picture.image
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.name, for: indexPath) as! TableViewCell
        
        let picture = pictures[indexPath.row]
        
        let path = getDocumentDirectory().appendingPathComponent(picture.image)
        
        cell.photo.image = UIImage(named: path.path)
        //cell.photo.layer.borderWidth = 2
        //cell.photo.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
        cell.namePhoto.text = picture.name
        return cell
    }
    
}

extension ViewController: UIImagePickerControllerDelegate {
    
}

extension ViewController: UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else {return}
        
        let imageName = UUID().uuidString
        let imagePath = getDocumentDirectory().appendingPathComponent(imageName)
        
        if let jpegData = image.jpegData(compressionQuality: 0.8){
            try? jpegData.write(to: imagePath)
        }
        
        let picture = Photo(image: imageName, name: "test")
        pictures.append(picture)
        
        tableView.reloadData()
        dismiss(animated: true)
        save()
    }
    
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
}
