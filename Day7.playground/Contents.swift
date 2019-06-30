import UIKit
// 1) using clousures as parameters when they accept parametrs
func travel (action:(String) -> Void ){
    print ("I am getting ready to go")
    action ("London")
    print ("I arrived")
}

travel {
    (place:String) in
    print ("I am going to \(place) in my car")
}

func fix(item: String, payBill: (Int) -> Void) {
    print("I've fixed your \(item)")
    payBill(450)
}
fix(item: "roof") { (bill: Int) in
    print("You want $\(bill) for that? Outrageous!")
}

print (fix)

func study(reviseNotes: (String) -> Void) {
    let notes = "Napoleon was a short, dead dude."
    for _ in 1...10 {
        reviseNotes(notes)
    }
}
study { (notes: String) in
    print("I'm reading my notes: \(notes)")
}

print (study)

func makeSale(signContract: (String) -> Void) {
    let clientName = "Apple"
    print("\(clientName) should buy our product.")
    print("You're interested? Great! Sign here.")
    signContract(clientName)
}
makeSale { (client: String) in
    print("We agree to pay you $100 million.")
    print("Signed, \(client)")
}

print (makeSale)


// 2) using closure as paramets when they return values

func travel1(action:(String) -> String) {
    print ("I am getting ready to go")
    let description = action("London")
    print (description)
    print (" I arrived!")
}

travel1 { (place : String ) -> String in
    return "I am going to \(place) in my car"
}


func loadData(input: () -> String) {
    print("Loading...")
    let str = input()
    print("Loaded: \(str)")
}
loadData {
    return "He thrusts his fists against the posts"
}

// 3) shorthand parameter names

func travel(action:(String)-> String ){
    print ("I am getting ready to go")
    let description = action("London")
    print (description)
    print ("I have arrived")
}

/*
travel { place in
    return "I am going to \(place)"
}
*/

travel {
    "I am going to\($0)"
}

// 4) closure with multiple parametrs

func trav(action:(String, Int) -> String){
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}

trav() {
    "I'm going to \($0) at \($1) miles per hour."
}


//5) capturing values

func ravel() -> (String) -> Void {
var counter = 1
    return {
        print ("\(counter). I'm going to \($0)")
        counter += 1
    }
    
}
