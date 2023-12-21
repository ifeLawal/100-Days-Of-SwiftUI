//: [Previous](@previous)

import Cocoa

// Closure

func greetUser() {
    print("Hi there")
}

greetUser()

var greetCopy = greetUser
var otherGreetCopy: () -> Void = greetUser
greetCopy()

let sayHello = {
    print("Hi there")
}

sayHello()

let sayName = { (name: String) -> String in
   "Hi \(name)"
}

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

let team = ["Gloria", "Suzanne", "Piper", "Tifanny", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}

let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)

let capSortedTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
})
/*
let shorthandSortedTeam = team.sorted { a, b in
    if a == "Suzanne" {
        return true
    } else if a == "Suzanne" {
        return false
    }
    
    return a < b
}
*/

let sorted = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    
    return $0 < $1
}


let reverseTeam = team.sorted { $0 > $1 }

let tOnly = team.filter { $0.uppercased().hasPrefix("T") }
print(tOnly)

let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)

func newGreetUser() {
    print("Hi there!")
}

newGreetUser()
var newGreetCopy: () -> Void = newGreetUser
greetCopy

func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    
    return numbers
}

let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}

print(rolls)

func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)

func doImportantWork(first: (_ number: Int) -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first(2)
    print("About to start second work")
    second()
    print("About to start third work")
    third()
}

doImportantWork{ a in
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}


// Checkpoint 5

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

// Your job is to:

// Filter out any numbers that are even
// Sort the array in ascending order
// Map them to strings in the format “7 is a lucky number”
// Print the resulting array, one item per line

let removeEven = { (num: Int) -> Bool in
    return !num.isMultiple(of: 2)
}

let ascSort = { (firstNumber: Int, secondNumber: Int) -> Bool in
    return firstNumber < secondNumber
}

let luckyNumber = { (num: Int) -> String in
    return "\(num) is a lucky number"
}

var luckyNumberStringForm = luckyNumbers
    .filter(removeEven)
    .sorted(by: ascSort)
    .map(luckyNumber)

let printString = {
    print($0)
}

luckyNumberStringForm.forEach(printString)
