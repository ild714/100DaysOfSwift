import UIKit

// 1) Aritmetic operators
let result = 13 % 4

// 2) Overloading

let book1 = ["Tolstoi","Puskin"]
let array = ["1","3"]

print (book1+array)

// 3) assigment

var score = 95
score += 5

// 4) comparison operators

let firstScore = 6
let secondScore = 4

firstScore != secondScore

// 5) condition

let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 1 {
    print ("BlackJack")
}
else {
    print ("Regular Cards")
}

// 6) combining condition

let one = 18
let two = 18

if one > 19 || two > 17 {
    print ("both more that 17")
    
}

// 7 ) Switch
let weather = "sunny"

switch weather {
case "sin" : print ("Bring ")
case "snow ": print ("Ok")
    default : print ("Bad")
}


let yourScore = 20
var highScore = 15
if yourScore >= highScore {
    print("You got the high score!")
}
