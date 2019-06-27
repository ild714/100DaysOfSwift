import UIKit

// 1) array
let name1 = "Ildar"
let name2 = "Bulat"
let name3 = "Vlad"

let array = [name1,name2,name3]

print (array[1])

// 2) set

let set = Set(["red","blue","dark"])

// 3) tuples

let tuple = (Taylor:1,Swift:2)
tuple.Swift

/*
 4) Difference between tuple, array , set .
 We use tuple when there is the certain position.
 We use set when we want have a unique values.
 We use aaray when we have some repetitions.
 
 */

// 5) Dictionaries
 let heights = [
    "Taylor Swift":1.78,
    "Vlad":1.80
]

heights["Taylor Swift"]

// 6) defalt dictionary
heights["Somebody",default: 1]

// 7) Empty collection

var team = [String:String]()
team["1"]="1"

var results = [Int]()

let words = Set<String>()

// 8) enumerations

enum Result {
    case seccess
    case failure
}

let res4 = Result.seccess
print (res4)

// 9) enum associated values

enum book {
    case first(topic:String)
}

let my = book.first(topic: "Drama")
print (my)

// 10 Enum row values
enum Planets:Int{
    case Earth
    case Mars
    case venus
}

let myPlanet = Planets.init(rawValue: 0)
