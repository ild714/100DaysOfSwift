import UIKit

// 1) Struct
// 2) computed properties

struct Sport {
    var name : String
    var isOlimpickSport : Bool
    
    var olympicStatus : String {
        if isOlimpickSport {
            return "\(name) is an Olympic sport"
        }
        else {
            return "\(name) is not an Olympic sport"
        }
    }
}

var tennis = Sport(name : " Tennis ", isOlimpickSport: true)
print (tennis.name)


tennis.name = "Law tennis"
print (tennis.name)
print (tennis.olympicStatus)


// 3) property observers

struct Progress {
    var task : String
    var amount : Int {
    didSet {
    print ("\(task) is now \(amount)% complete" )
        }
        
    }
}

var new = Progress(task : "Run",amount: 50)
print (new.amount)

new.amount = 40
new.amount = 50

// 4) Methods

struct City {
    var population : Int
    func collectTaxes() -> Int {
        return population*1000
    }
}

let city1 = City(population: 1000)
print (city1.collectTaxes())

// 5) Mutating methods

struct Person {
    var name : String
    
    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

var person = Person(name: "Ann")
person.makeAnonymous()

// 6) properties and methods of string

let string = "Do or do not , there is no try"

print (string.count)
print (string.hasPrefix("Do"))
print (string.uppercased())
print (string.sorted()
)

var toys = ["Woody"]
print (toys.count)
toys.append("hello")
toys.sorted()
toys.firstIndex(of: "Woody")
toys.remove(at: 0)
print (toys)
