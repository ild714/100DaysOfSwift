import UIKit

// 1) protocol

protocol Identifiable {
    var id : String {get set}
}

struct User : Identifiable {
    var id : String
}

func displayID(thing: Identifiable) {
    print ("My id is \(thing.id)")
}

let i = User(id: "12")
displayID(thing: i)


// 2) protocol inheritance

protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days : Int)
}

protocol Emloyee : Payable, NeedsTraining, HasVacation {}

//3) extenion

extension Int {
    func squared () -> Int {
        return self * self
    }
}

var num = 8
print (num.squared())

extension Int {
    var isEven : Bool {
        return self % 2 == 0
    }
}

print (num.isEven)

// 4) protocol extension

let pythons = ["Eric","Graham","John"]
let beatles = Set(["Join","paul"])

extension Collection {
    func summarize() {
        print ("There are \(count) of us" )
        
            for name in self {
            print (name)
        }
    }
}

pythons.summarize()

// 5) protocol oriented programming

protocol Identifiable1 {
    var id : String {get set}
    func identify()
}

extension  Identifiable1 {
    func identify() {
        print ("My Id is \(id)")
    }
}

struct User1 : Identifiable1 {
    var id : String
}

let two = User1(id: "one")
two.identify()

