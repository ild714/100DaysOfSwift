import UIKit
 // 1)
struct Person {
    var clothes : String {
        willSet {
            updateUI(msg:"I am going to change \(clothes) to \(newValue)")
        }
        didSet {
            updateUI(msg:"I have just change \(oldValue) to \(clothes)")
        }
    }
}

func updateUI (msg: String){
    print (msg)
}

var Tim = Person(clothes:"T-shirt")
Tim.clothes = "jacket"

struct Person1 {
    private var age : Int
    
    init (age : Int ){
        self.age = age
    }
    var ageInDogYears : Int {
        get {
            return age * 7
        }
    }
}

var Tom = Person1(age:20)
print (Tom.ageInDogYears)

//2)

class Taylor {
    fileprivate var name : String?
}

//3)

class Album {
    var name : String
    init (name : String){
        self.name = name
    }
    func getPerformance() -> String {
        return "The album \(name) sold lots"
    }
}

class LiveAlbom: Album {
    var location : String
    init (name:String,location:String){
        self.location = location
        super.init(name:name)
    }
    override func getPerformance() -> String {
        return "The LiveAlbom  \(name) sold lots."
    }
}

class StudioAlbom : Album {
    var studio : String
    init (name: String, studio: String){
        self.studio = studio
        super.init(name:name)
    }
    override func getPerformance() -> String {
        return "The StudioAlbom \(name) sold lots"
    }
}

var taylorSwift = StudioAlbom(name:"Tylor Swift",studio: "The castles Studio")
var fearless = StudioAlbom(name:"Fearless",studio:"Aimeeland Studio")
var iTunesLive = Album(name:"iTunes live")

var allAlbums : [Album] = [taylorSwift,fearless] //Polymophism

for album in allAlbums {
    //print (album.getPerformance()) // Polymorphism in action
    if let studioAlbum = album as? StudioAlbom {
        print (studioAlbum.getPerformance())
    } else if let album = album as? Album {
        print (album.getPerformance())
    }
}

for album1 in allAlbums as! [StudioAlbom] {
    print (album1.getPerformance())
    print (album1.studio)
}

//4)

let vw = UIView()
UIView.animate(withDuration:0.5,animations: {
    vw.alpha = 0
})

//5)

let driving = {
    print ("I am driving in my car")
}
driving()

let driving1 = { (place : String) in
    print ("I am going in \(place)")
}

driving1("London")

let driving2 = { (place : String) -> String in
    return ("I am going in ? \(place)")
}

driving2("London")

let driving3 = {
    print ("I am driving in my car")
}

func drive (travel : () -> Void ) {
    print ("I am ready")
    travel()
}

drive(travel : driving3) // trailing closure syntax !

func travel( action : ()->Void) {
    print ("I am getting ready to go")
    action()
    print ("I am here")
}

let travel = {
print ("go go")
}

func goOnVacation(to destination: String,  activities: () -> Void) {
    print("Packing bags...")
    print("Getting on plane to \(destination)...")
    activities()
    print("Time to go home!")
}
goOnVacation(to: "Mexico", activities: travel)

func travel1 (action:(String)->Void){
    print ("I am getting rady to go")
    action("London")
    print ("I am here")
}

travel1 {(place: String) in
print ("I am going to \(place) in my car")
}

func travel2 (action:(String)->String) {
    print ("I am getting ready to go")
    let description = action("London")
    print (description)
    print ("I arrived")
}

travel2 {
    (place: String ) -> String in
        return " I am going to \(place) in my car"
}

func manipulate(numbers: [Int], using algorithm: (Int) -> Int) {
    for number in numbers {
        let result = algorithm(number)
        print("Manipulating \(number) produced \(result)")
    }
}
manipulate(numbers: [1, 2, 3]) { (number : Int)->Int in
    return number * number
}

func encrypt(password: String, using algorithm: (String) -> String) {
    print("Encrypting password...")
    let result = algorithm(password)
    print("The result is \(result)")
}
encrypt(password: "t4ylor") { (password: String)->String in
    print("Using top secret encryption!")
    return "SECRET" + password + "SECRET"
}


