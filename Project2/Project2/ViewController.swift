//
//  ViewController.swift
//  Project2
//
//  Created by Ильдар Нигметзянов on 28/08/2019.
//  Copyright © 2019 Nigmetzyanov Ildar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var answered = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia","france","germany","ireland","italy","monaco","nigeria","poland","russia","spain","uk","us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
        
    }

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        
        title = "\(countries[correctAnswer].uppercased()), score:\(score)"
    }

    func checkCorrect(_ sender: UIButton) -> String {
        if sender.tag == correctAnswer {
            //title = "Correct"
            score+=1
            return "Correct"
        } else {
            //title = "Wrong"
            //score-=1
            return "Wrong"
        }
    }
    
    func show(_ title : String) {
        let ac = UIAlertController(title: "Wrong", message: "That's: \(title)", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        answered += 1
        
        
        if answered == 10 {
            title = checkCorrect(sender)
            
            if title == "Wrong" {
                let ac = UIAlertController(title: "That is \(countries[sender.tag].uppercased())", message: "Final score:\(score)", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "New game", style: .default, handler: askQuestion))
                present(ac,animated: true)
            } else {
                let ac = UIAlertController(title: "Final score", message: "\(score)", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "New game", style: .default, handler: askQuestion))
                present(ac,animated: true)
            }
            answered = 0
            score = 0
        } else {
            
            title = checkCorrect(sender)
            
            if title == "Wrong" {
                title = "\(countries[sender.tag].uppercased())"
                show(title)
            }
            else {
                askQuestion()
            }
        }
    }
    
}

