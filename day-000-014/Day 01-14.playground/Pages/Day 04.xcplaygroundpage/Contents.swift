//: [Previous](@previous)

import Foundation

// Type annotations

let surname = "Lasso" // Infered String
var score = 0 // Inferred Integer
var name: String = "Paul"
var price: Double = 10
let pi: Double = 3.141
var albums: [String] = ["Red", "Fearless"]
var user: [String: String] = ["id": "@twostraws"]
var books: Set<String> = Set([
    "The Bluest Eye",
    "Foundation",
    "Girl, Woman, Other"
])
var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]
var teams: [String] = [String]()
var cities: [String] = []
var clues = [String]()

enum UIStyle {
    case light, dark, system
}
var style: UIStyle = UIStyle.light
style = .dark

let username: String
// lots of complex logic
username = "@twostraws"
// lots of more complex logic
print(username)

// let scores: Int = "Zero" -> not possible! since the type is not valid

// Checkpoint 2
// Create an array of strings, then write some code that prints the number of items in the array and also the number of unique items in the array.
var fruits: [String] = ["Banana", "Apple", "Kiwi", "Mango"]
var names: [String] = ["Joe", "Joe", "Steve", "Bob"]
print(fruits.count)
let uniqueNames = Set(names)
print(names.count)
print(uniqueNames.count)

