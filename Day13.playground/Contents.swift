import UIKit

// 1) let - code is more faster
var name = "Person1"
name = "Romeo"

// 2)
var age: Int
age = 25

var latitude : Double
latitude = 36.1666667

var longitude : Float //limit
longitude = -86.1444444

var stayOutToolate: Bool
stayOutToolate = true

// 3)
var a = 10
a = a - 1
a = a + 1
a = a * a

var b = 10
b += 10
b -= 10

var a1 = 1.1
var b1 = 2.2
var c = a1 + b1

c > 3
c >= 3
c > 4
c < 4

var name1 = "Romeo"
var name2 = "Tim"
var both = name1 + " and " + name2

var name3 = "Bob"
name3 == "BoB"

var stayOut = true
!stayOut

name3 != "Bob"

// 4)

// 5
var numbers = [1,2,3]
var song: [Any] = ["Back to December" , "Simple way",5]

song[0]
type(of:song)

var song1 : [String] = []
// song1 = [String]()

//6)
var person = ["Swift","Stiev","Tom"]
var personDic = [
                  "first":"Taylor",
                  "midddle":"Stiev",
                  "last":"Swift"
                ]

personDic["first"]

// 7)

// 8)

for i in 1...10 {
    print ("i * 10 is \(i*10)")
}

var songs = ["Belong with me","Look at me"]

for song in songs {
    print ("my farite song is \(song)")
}

let passingGrade = 70...100
print (passingGrade)

let color = Set(["red","blue","dark"])

var name = (first:"1",second:"2")
