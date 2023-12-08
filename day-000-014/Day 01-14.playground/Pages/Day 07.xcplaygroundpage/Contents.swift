//: [Previous](@previous)

import Cocoa

print("Welcome to my app!")
print("By default This prints out a conversion")
print("chart from centimeters to inches, but you")
print("can also set a custom range if you want.")

func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

showWelcome()

let number = 139

if number.isMultiple(of: 2) {
    print("Even")
} else {
    print("Odd")
}

let roll = Int.random(in: 1...20)

func printTimesTable(num: Int) {
    for i in 1...12 {
        print("\(num) * \(i) = \(num * i)")
    }
}

printTimesTable(num: 5)

func printTimesTableWithEnd(number: Int, end: Int) {
    for i in 1...end {
        print("\(number) * \(i) = \(number * i)")
    }
}

printTimesTableWithEnd(number: 5, end: 10)
// printTimesTableWithEnd(end: 5, number: 10)  <- parameter order matters

let root = sqrt(169)
print(root)

func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice
print(result)

func rollDiceNumber(number: Int) -> Int {
    return Int.random(in: 1...number)
}

func doStrings(stringOne: String, stringTwo: String) -> Bool {
    stringTwo.sorted() == stringOne.sorted()
}

print(doStrings(stringOne: "leaf", stringTwo: "alef"))

func hypothenuse(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b);
}

let c = hypothenuse(a: 3, b: 4)
print(c)

func sayHello() {
    return
}

// Muliple returns -> tuples

func isUppercase(tempString: String) -> Bool {
    tempString == tempString.uppercased()
}

func getUser() -> [String] {
    ["Taylor", "Swift"]
}

let user = getUser()

print("Name: \(user[0]) \(user[1])")

func dictGetUser() -> [String: String] {
    return ["firstName": "Taylor", "lastName": "Swift"]
}

let dictUser = dictGetUser()

print("Name: \(dictUser["firstName", default: "?"]) \(dictUser["lastName", default: "?"])")

func tupleGetUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let tupleUser = tupleGetUser()
print("Name: \(tupleUser.firstName) \(tupleUser.lastName)")

let (firstName, lastName) = tupleGetUser()
print("Name: \(firstName) \(lastName)")

func tupleGetUserAlt() -> (firstName: String, lastName: String) {
    ("Keanu", "Reeves")
}

let tupleAltUser = tupleGetUserAlt()
print("Name: \(tupleAltUser.firstName) \(tupleAltUser.lastName)")

func tupleGetSimpleUser() -> (String, String) {
    ("Guy", "Fieri")
}
let tupleSimpleUser = tupleGetSimpleUser()
print("Name: \(tupleSimpleUser.0) \(tupleSimpleUser.1)")

func rollDiceXTimes(sides: Int, count: Int) -> [Int] {
    var rolls = [Int]()
    
    for _ in 1...count {
        rolls.append(Int.random(in: 1...sides))
    }
    return rolls
}

func hireEmployee(name: String) { }
func hireEmployee(title: String) { }
func hireEmployee(location: String) { }

let lyric = "I see a red door and I want it painted black."
print(lyric.hasPrefix("I see"))

func isUpperCaseString(_ stringOne: String) -> Bool {
    stringOne == stringOne.uppercased()
}

let string = "HELLO, WORLD"
let resultUppercased = isUpperCaseString(string)

func printTimesTable(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTable(for: 5)
