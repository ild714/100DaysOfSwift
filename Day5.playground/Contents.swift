import UIKit

// 1) function
func printHelp() {
    let message = """
Welcome to my app!
"""
    print (message)
}

printHelp()

// 2)

func square(number: Int) {
    print (number*number)
}

square(number:6)

// 3) return

func square1( number : Int ) -> Int {
    return number * number
}

let result = square1(number: 8)
print (result)

// 4) parametr labels

func sayHello ( to name : String)  {
    print ("Hello \(name)")
}

sayHello(to: "Ildar" )

// 5) omitting parametr labels

func greet (_ person : String ){
    print ("hello, \(person)")
}

greet("Ildar")

// 6) default parametrs

func greet2 (_ person : String , nicely : Bool = true ){
    if nicely == true {
        print ("hello \(person)")
    } else
    {
        print ("Oh no , it is\(person) again ...")
    }
}

greet2 ("Taylor")
greet2("Taylor",nicely: false)

// 7) variadic function

func square(numbers : Int...){
    for number in numbers {
        print ("\(number) squared is \(number * number)")
    }
}

square(numbers: 1, 2, 3)

// 8) writing throwing functions

enum PasswordError : Error {
    case obvious
}

func checkPassword (_ password : String ) throws -> Bool {
    if password == "password"{
        throw PasswordError.obvious
    }
    return true
}

do {
    try checkPassword("password7")
    print ("That password is good!")
} catch {
    print ("You can't use that password.")
}

// inout paramets 
func num (_ number : inout Int ) {
    number = 1
    print (number)
}
var myNum = 3
num(&myNum)
