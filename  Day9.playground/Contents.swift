import UIKit

// 1) initializers

struct Name {
    var userName : String
    init(){
        userName = "Anonymous"
        print ("Creating a new user")
    }
}

var name1 = Name()

// 2) reffering to the current instance

struct Person {
    var name : String
    init(name: String){
        print("\(name) was born")
        self.name = name
    }
}

var person1 = Person(name: "ILdar")

// 3) lazy properties

struct FamilyTree {
    init(){
        print ("Creating family tree")
    }
}

struct Person1{
    var name: String
    lazy var familyTree = FamilyTree()
    
    init(name: String){
        self.name = name
    }
}

var person2 = Person1(name: "Ildar")
person2.familyTree

// 4) Static properties and methods

struct Student {
    static var classSize = 0
    var name : String
    
    init(name : String){
    self.name = name
        Student.classSize+=1
    }
}

let ed = Student(name: "Ed")
let ann = Student(name: "Ann")

print (Student.classSize)

// 5) acess control

struct privatePerson {
    private var id : String
    init(id:String){
        self.id = id
    }
    func myId() -> String{
        return "My id = \(id)"
    }
}

let person3 = privatePerson(id: "15")
print (person3.myId())
