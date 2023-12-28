//: [Previous](@previous)

import Cocoa

// Optional

let opposites = ["Mario": "Wario", "Luigi": "Waliugi"]
let peachOpposite = opposites["Peach"]

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

var username: String? = nil

if let unwrappedName = username {
    print("We go a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

var num1 = 1_000_000
var num2 = 0
var num3: Int? = nil

var str1 = "Hello"
var str2 = ""
var str3: String? = nil

var arr1 = [0]
var arr2 = [Int]()
var arr3: [Int]? = nil

func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil
if let unwrappedNumber = number {
    print(square(number: unwrappedNumber))
}

let tableHeight: Double? = 100
//if tableHeight > 85.0 {
//    print("The table is too high.")
//}

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }
    
    print("\(number) X \(number) is \(number * number)")
}

var myVar : Int? = 3
if let unwrapped = myVar {
    // Run if myVar has a value inside
    print(unwrapped)
}

//guard let unwrapped = myVar else {
//    // Run if myVar doesn't have a value inside
//    print()
//}

// Swift requies you to use return if a guard check fails
// If the optional you're unwrapping has a value, you can use it after the guard code finishes

//  if the optional you're unwrapping has a value, you can use it after the guard code finishes

func emptyGuard() {
    guard arr1.isEmpty else {
        print()
        return
    }
}


// nil coalescing
let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A" // Alternative captains["Serenity", default: "N/A"]

let tvShows = ["", "", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

let input = ""
let numberNew = Int(input) ?? 0
print(numberNew)

// optional chaining ()?.operation
// if the optional has a value inside, unwrap it
// if the optional has a nil, do nothing
let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

// We have an optional instance of a Book struct
// The book might have an author, or might be anonymous
// If it has an author, attempt to read the first letter
// If the first letter is there, uppercase it

struct NewBook {
    let title: String
    let author: String?
}

var newbook: NewBook? = nil
let newAuthor = newbook?.author?.first?.uppercased() ?? "A"
print(newAuthor)

// How you define an optional array
let newCaptains: [String]? = ["Archer", "Lorca", "Sisko"]

let capitals = ["Scotland": "Edinburgh", "Wales": "Cardiff"]
let scottishCapital = capitals["Scotland"]?.uppercased()

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {  // optional try will not through the error
    print("User: \(user)")
}

let userNew = (try? getUser(id: 23)) ?? "Anonymous"
print(userNew)

/*
 Checkpoint 9
 Write a function that accepts an optional array of integers, and returns one randomly. If the array is is missing or empty, return a random number in the range of 1 through 100
 */

func getRandomInt(array: [Int]?) -> Int {
    return array?.randomElement() ?? Int.random(in: 1...100)
}
