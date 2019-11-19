//
//  ViewController.swift
//  Project5
//
//  Created by Ильдар Нигметзянов on 24.10.2019.
//  Copyright © 2019 Learning Swift. All rights reserved.
//

import UIKit

var allWords = [String]()
var usedWords = [String]()

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        
        if let startWordsURL = Bundle.main.url(forResource:"start",withExtension:"txt"){
            if let startWords = try? String(contentsOf:startWordsURL){
                allWords = startWords.components(separatedBy:"\n")
            }
        }
        
        if allWords.isEmpty {
            allWords = ["silkworm"]
        }
        
        startGame()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "New game", style: .plain, target: self, action: #selector(startGame))
    }

    @objc func startGame() {
        title = allWords.randomElement()
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word",for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
    
    @objc func promptForAnswer() {
        let ac = UIAlertController(title:"Enter answer",message:nil,preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title:"Submit",style:.default){[weak self,weak ac] action in
            guard let answer = ac?.textFields?[0].text else {return}
            self?.submit(answer)
        }
        ac.addAction(submitAction)
        present(ac,animated: true)
    }
    
    func submit(_ answer: String){
        let lowerAnswer = answer.lowercased()
        
        if isPossible(word: lowerAnswer){
            if isOriginal(word: lowerAnswer){
                if isReal(word: lowerAnswer){
                    
                    usedWords.insert(answer.lowercased(),at:0)
                    
                    let indexPath = IndexPath(row: 0, section: 0)
                    tableView.insertRows(at: [indexPath],with: .automatic)
                    
                    return
                } else {
                    errorMes(title: "Word not recognised", message: "You can't just make them up, you know!")
                }
            } else {
                errorMes(title: "Word used already", message: "Be more original!")
            }
        } else {
            guard let title = title?.lowercased() else {return}
            errorMes(title: "Word not possible", message: "You can't spell that word from \(title)")
        }
        
    }
    
    func errorMes(title: String, message: String){
        let ac = UIAlertController(title:title,message: message,preferredStyle: .alert)
        ac.addAction(UIAlertAction(title:"ok",style: .default))
        present(ac,animated: true)
    }
    
    func isPossible(word: String) -> Bool {
        guard var tempWord = title?.lowercased() else {return false}
        
        for letter in word {
            if let position = tempWord.firstIndex(of: letter){
                tempWord.remove(at: position)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isOriginal(word: String) -> Bool {
        return !usedWords.contains(word)
    }
    
    func isReal(word: String) -> Bool {
        if word.count < 3 || word == title {
            return false
        }
        let checker = UITextChecker()
        let range = NSRange(location: 0,length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word,range: range,startingAt: 0,wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    
}

