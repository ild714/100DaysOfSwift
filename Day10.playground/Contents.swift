import UIKit

// 1) creating classes  ! own init

class Dog {
    var name : String
    var breed : String
    
    init(name : String , breed: String){
        self.name = name
        self.breed = breed
    }
    
    func gaf(){
    print ("woof")
    }
}

let poppy = Dog(name: "Poppy", breed: "Poodle")
print (poppy.breed)

// 2) ! inheritance
// 3) ! overriding

class Poodle : Dog {
    init(name : String){
        super.init(name: name, breed: "Poodle")
    }
    override func gaf() {
    print ("yep")
    }
}

let poppy1 = Poodle(name: "Poppy1")
print (poppy1.breed)
poppy1.gaf()

// 4) final class !cannot inherite it

final class Dog1 {
    
}

// copying objects
class Singer {
    var name = "Taylor Swift"
}

var singer = Singer()
print (singer.name)

var singerCopy = singer
singerCopy.name = "Somebody else"

print (singer.name)

// !deinitialiers

class Person {
    var name = "Join"
    
    init(){
        print ("\(name) is here")
    }
    
    func me(){
        print ("hello My name is \(name)")
    }
    
    deinit{
        print ("\(name) is not more")
    }
}

for _ in 1...3 {
    let person = Person()
    person.me()
}

// Mutability

class Singer1 {
    var name = "Taylor Swift"
}

let taylor = Singer1()
taylor.name = "Edd"
print (taylor.name)
