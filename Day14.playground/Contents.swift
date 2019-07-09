import UIKit

// 1)

func myBook(name:String, year : Int) {
    print ("My book \(name), \( year )")
}

myBook(name: "1",year: 1234)

func countLettersInString (in str: String ){
    print ("The string \(str) has \(str.count) letters")
}

countLettersInString(in : "name")

func albomIsTaylors(name: String) -> Bool{
    if name == "Taylor" { return true}
    if name == "Swift" {return true}
    return false
}

albomIsTaylors(name:"Swift")


func runRace(distance: Int = 10) {
    if distance < 5 {
        print("This should be easy!")
    } else if distance < 10 {
        print("This should be a nice challenge.")
    } else {
        print("Let's do this!")
    }
}

// 2)

func albomReleased (year : Int) -> String? {
    switch year {
    case 2008 : return ("Taylor Swift")
    case 2006 : return ("Fearless")
    default : return nil
    }
}

let res = albomReleased(year:2001)?.uppercased()
let res1 = albomReleased(year:2006) ?? "unknown" //!!!
print (res1)

func describe(array: [String]?) {
    let unwrapped = array!
    print("The array has \(unwrapped.count) items.")
}
describe(array:["dwd"])

// 3)

enum Weather {
    case cloud
    case sun
    case rain
    case wind
}

func statusWeather (weather: Weather) -> String? {
    switch weather {
    case .sun : return ("good")
    case .cloud, .wind : return (nil)
    default : return (nil)
    }
}

statusWeather(weather:.rain)

enum WeatherType {
    case sun
    case cloud
    case rain
    case wind(speed: Int)
    case snow
}

func getHaterStatus (weather: WeatherType) -> String? {
    switch weather {
    case .sun : return nil
    case .cloud, .wind :
        return "dislike"
    case .wind(let speed) where speed < 10 :
    return "meh"
    case .rain, .snow :
    return "hate"
    }
}
getHaterStatus(weather:.rain)

struct BankAccount {
    var name: String
    var isMillionnaire = false
    var balance: Int {
        didSet {
            if balance > 1_000_000 {
                isMillionnaire = true
            } else {
                isMillionnaire = false
            }
        }
    }
}
var e = BankAccount(name: "one", isMillionnaire: true, balance: 14)
e.balance = 15

struct Doctor {
    var name: String
    var location: String
    //private var currentPatient = "No one"
}
let drJones = Doctor(name: "Esther Jones", location: "Bristol")

struct App {
    var name: String
    private var sales = 0
    init(name: String) {
        self.name = name
    }
}
let spotify = App(name: "Spotify")


