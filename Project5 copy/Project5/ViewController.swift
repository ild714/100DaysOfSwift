//
//  ViewController.swift
//  Project5
//
//  Created by Ильдар Нигметзянов on 07/09/2019.
//  Copyright © 2019 Nigmetzyanov Ildar. All rights reserved.
//

import UIKit

var allWords = [String]()
var usedWords = [String]()

var dataSave = Save()

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "New game", style: .plain, target: self, action: #selector(newGame))
        
        if let startWordsURL = Bundle.main.url(forResource:"start",withExtension: "txt"){
            if let startWords = try? String(contentsOf: startWordsURL){
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        
        if allWords.isEmpty{
            allWords = ["silkworn"]
        }
        
        startGame()
        
    }

    @objc func newGame() {
        title = allWords.randomElement()
        dataSave.title = title
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
        dataSave.words = [String]()
        save()
    }
    
    @objc func startGame() {
        
        let defaults = UserDefaults.standard
        
        if let data = defaults.object(forKey: "test") as? Data{
            let decoder = JSONDecoder()
            do {
                dataSave = try decoder.decode(Save.self,from:data)
                
            } catch {
                print ("error")
            }
        }
        
        
        title = dataSave.title
        dataSave.title = title
        usedWords = dataSave.words
        print (usedWords)
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
    
    @objc func promptForAnswer() {
        let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
        ac.addTextField()
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] action in
            guard let answer = ac?.textFields?[0].text else {return}
            self?.submit(answer)
            //self.save()
        }
        ac.addAction(submitAction)
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
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound && word.count >= 3 && !(word == title?.lowercased())
    }
    
    func submit(_ answer: String){
        let lowerAnswer = answer.lowercased()
        
        if isPossible(word: lowerAnswer){
            if isOriginal(word: lowerAnswer){
                if isReal(word: lowerAnswer){
                    usedWords.insert(answer.lowercased(), at:0)
                    
                    let indexPath = IndexPath(row: 0, section: 0)
                    tableView.insertRows(at:[indexPath],with: .automatic)
                    
                    dataSave.words.append(answer.lowercased())
                    save()
                    return
                } else {
                    showErrorMessage(title: "Word not recognised", message: "You can't just make them up, you know!")
                }
            } else {
                showErrorMessage(title: "Word used already", message: "Be more original")
            }
        } else {
            guard let title = title?.lowercased() else {return}
            showErrorMessage(title: "Word not possible", message:  "You can't spell that word from \(title)")
        }
        

    }
    
    func showErrorMessage(title: String,message: String){
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present (ac, animated: true)
    }
    
    func save() {
        let defaults = UserDefaults.standard
        let encoder = JSONEncoder()
        
        if let data = try? encoder.encode(dataSave) {
            defaults.set(data, forKey: "test")
        } else {
            print ("error")
        }
    }
}

