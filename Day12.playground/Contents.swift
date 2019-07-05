import UIKit


// 0) Typecasting
class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}

// 1) optionals

var age : Int? = nil

//2) unwrapping optionals

var name : String? = nil

if let unwrapped = name {
    print ("\(unwrapped.count) letters")
} else {
    print ("Missing name")
}

//3) guard let

func greet (_ name:String?) {
    guard let unwrapped = name else {
        print ("You did not provide a name")
        return
    }
    print ("Hello, \(unwrapped)!")
}

//4) force unwrapping

let str = "5"
let num = Int(str)!


//5) nil coalescing

let user = username(for: 15) ?? "Anonymous"

//6) optional chaining

let beatle = names.first?.uppercased()
