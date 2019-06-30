import UIKit

// 1)
let driving = {
    print ("I am driving now" )
}

driving()

// 2) accepting parameters in a closure

let driving1 = { (place : String ) in
    print ("I am going to \(place) in my car")
}

driving1("London")

// 3) returning closure

let drivingWithReturn = {
    (city : String ) -> String in
    return ("I am going to \(city)")
 }

let whereGo = drivingWithReturn("London")
print (whereGo)

// 4) closures as paramets

func travel(action : () -> Void) {
    print ("I am getting ready to go.")
    action()
    print ("I arrived!")
}

travel {
    print("I am driving in my car")
}
