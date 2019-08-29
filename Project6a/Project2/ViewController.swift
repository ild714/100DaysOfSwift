//
//  ViewController.swift
//  Project2
//
//  Created by Ильдар Нигметзянов on 17/07/2019.
//  Copyright © 2019 Learning with Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var tappedAmount = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia","france","germany","ireland","italy", "nigeria","poland","russia","spain","us","uk"]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareAmount))
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    func askQuestion(action : UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased()) , score: \(score)"
    }
/*
    func timeStop(action : UIAlertAction! = nil) {
        sleep(10)
    }
   */
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Finish"
            tappedAmount += 1
            score += 1
            if tappedAmount == 10 {
                let ac = UIAlertController(title: title, message: "Your final score is \(score)",preferredStyle: .alert)
                ac.addAction(UIAlertAction(title:"Start new game",style:.default,handler : askQuestion))
                
                present(ac,animated:true)
                
                score = 0
                tappedAmount = 0
            }
                else {
                    askQuestion()
                }
            
        } else {
            tappedAmount += 1
            if tappedAmount == 10 {
                title = "Finish"
                let ac3 = UIAlertController(title : "Wrong!" ,message:"That is the flag of \(countries[sender.tag].uppercased()) and you finish the game with score \(score) ",preferredStyle: .alert)
                ac3.addAction(UIAlertAction(title:"Ok, start a new game!",style:.default,handler: askQuestion))
               
                present(ac3,animated:true)
                score = 0
                tappedAmount = 0
                
            } else {
            title = "Finish"
            score -= 1
            let ac1 = UIAlertController(title : "Wrong!" ,message:"That is the flag of \(countries[sender.tag].uppercased())",preferredStyle: .alert)
            ac1.addAction(UIAlertAction(title:"Ok",style:.default,handler: askQuestion))
            present (ac1,animated: true)
            }
        }
        
       
    }
    
    @objc func shareAmount() {
    
        let vc = UIActivityViewController(activityItems: [String(score)], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc,animated: true)
    }
    
}

