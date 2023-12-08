//: [Previous](@previous)

import Cocoa

// Loops

// For loops
let platforms = ["iOS", "macOs", "tvOs", "watchOS"]

for os in platforms {
    print("Swift works great on \(os).")
}

for i in 1...12 { // range of 1 - 12 including the first and last values
    print("5 x \(i) is \(5 * i)")
}

for i in 1...12 {
    print("The \(i) times table")
    
    for j in 1...12 {
        print("     \(j) * \(i) is \(j * i)")
    }
    
    print()
}

for i in 1...5 {
    print("Counting from 1 through 5: \(i)")
}

for i in 1..<5 {
    print("Counting from 1 up to 5: \(i)")
}

var lyric = "Haters gonna"

for _ in 1..<5 {
    lyric += " hate"
}

print(lyric)

// While loops

var countdown = 10

while countdown > 0 {
    print("\(countdown)")
    countdown -= 1
}

print("Blast off!")

let id = Int.random(in: 1...1000) // range including base and max
let amount = Double.random(in: 0...1)

var roll = 0

while roll != 20 {
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}

print("Critical hit!")

// Break to stop a loop and continue for skipping in a loop

let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }
    
    print("Found picture: \(filename)")
}

let numberOne = 4
let numberTwo = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: numberOne) && i.isMultiple(of: numberTwo) {
        multiples.append(i)
        
        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)

// FizzBuzz checkpoint

for i in 1...100 {
    if i % 3 == 0 && i % 5 == 0 {
        print("FizzBuzz")
    } else if i % 3 == 0 {
        print("Fizz")
    } else if i % 5 == 0 {
        print("Buzz")
    } else {
        print(i)
    }
}
