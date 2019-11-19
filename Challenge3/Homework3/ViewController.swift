//
//  ViewController.swift
//  Homework3
//
//  Created by Ильдар Нигметзянов on 31.10.2019.
//  Copyright © 2019 Learning Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var topiks = [String]()
    var answers = [String]()
    var number = 0
    var field : UILabel!
    var text: UITextField!
    //var txt = ""
    var txtUsed = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var mas = [String]()
        
        if let file = Bundle.main.url(forResource: "game", withExtension: "txt") {
        if let url = try? String(contentsOf: file){
            mas = url.components(separatedBy: "\n")
            }
            mas.remove(at: 2)
        }
        
        for (_,answer) in mas.enumerated(){
            let res = answer.components(separatedBy: "|")
            answers.append(res[0])
            topiks.append(res[1])
        }
        
        
        view = UIView()
        view.backgroundColor = .white
        
        let topick = UILabel()
        topick.translatesAutoresizingMaskIntoConstraints = false
        topick.text = topiks[number]
        view.addSubview(topick)
        
        field = UILabel()
        field.translatesAutoresizingMaskIntoConstraints = false
        
        for i in answers{
        let amount = i.count
            var str = ""
            for _ in 0...amount {
                
                str += "?"
            }
            field.text = str
        }
        
        view.addSubview(field)
        
        text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .red
        view.addSubview(text)
        
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Submit", for: .normal)
        button.layer.borderWidth = 2
        view.addSubview(button)
        
        NSLayoutConstraint.activate([text.topAnchor.constraint(equalTo: field.bottomAnchor, constant: 100),
            text.centerXAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: view.centerXAnchor, multiplier: 0),
            button.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 50),
            button.centerXAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: view.centerXAnchor, multiplier: 0)])
        
        topick.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 50).isActive = true
        topick.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        
        field.topAnchor.constraint(equalTo: topick.bottomAnchor,constant: 150).isActive = true
        field.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        
        button.addTarget(self, action: #selector(push), for: .touchUpInside)
    }

    @objc func push(_ sender: UIButton){
        guard let text1 = text.text?.lowercased() else {return}
        var txt = ""
        for i in answers[number] {
            if String(i) == text1 {
                txtUsed.append(text1)
            }
        }
        /*
        if text1.count==1 && answers[number].contains(text1){
            for i in 0...answers[number].count{
                for j in answers[number]{
                if text1 == String(j) || txt.contains(txtUsed[i]) {
                    txt+=text1
                    txtUsed.append(text1)
                } else {
                    txt+="?"
                }
            }
        field.text = txt
        
        }
    }
    */
        //let s = "basketball"
        for letter in answers[number] {
            let strLetter = String(letter)
            
            if txtUsed.contains(strLetter){
                txt += strLetter
            } else {
                txt += "?"
            }
        }
        field.text = txt
    }
 
}

