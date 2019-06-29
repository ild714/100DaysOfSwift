import UIKit

// 1) loop

let count = 1...10

for number in count{
    print ("Number is\(number)")
}

let albums = ["Red","1989","Repetition"]

for album in albums {
    print ("\(album) is on Apple musick")
}

// 2) while loop

var number = 1
while number <= 20 {
    print (number)
    number+=1
}

// 3) exiting multiple loops

outerloop: for i in 1...10{
    for j in 1...10{
        let product = i*j
        print ("\(i)*\(j) is \(product)")
        
        if product == 50 {
            print ("It is a bullseye")
            break outerloop
        }
    }

}

// 4) skipping items

for i in 1...10 {
    if i%2 == 1 {
        continue
    }
    print (i)
}

// 5) infinite loops

var counter = 0

while true {
    print (" ")
    counter += 1
    
    if counter == 273 {
        break
    }
}
