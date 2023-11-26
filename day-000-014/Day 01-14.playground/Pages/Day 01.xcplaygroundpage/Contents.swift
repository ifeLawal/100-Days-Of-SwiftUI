//: [Previous](@previous)

import Cocoa

var greeting = "Hello, playground"

print(greeting)

greeting = "Happy thanksgiving, Ted"

print(greeting)

let genericGreeting = "Welcome, "
let person = "Paul"

print (genericGreeting + person)

// Escape character
let quote = "Then he tapped a sign saying \"Belive\" and walked away"

// Multiline
let movie = """
A day in
the life of an
Apple engineer
"""

// Built in string properties and methods
print(person.count)
let nameLength = person.count
print(nameLength)

print(person.uppercased())
print(quote.hasPrefix("Then he"))
print(movie.hasSuffix("engineer"))

// Whole numbers
let score = 10
let reallyBid = 100_000_000
let lowerScore = score - 2
let higherScore = score + 10
let doubleScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2

var counter = 10
counter += 5
print(counter)

counter *= 2
counter -= 10
counter /= 2

// Built in integer methods
let number = 120
print(number.isMultiple(of: 5))
print(120.isMultiple(of: 3))

let numberDouble = 0.1 + 0.2
print (numberDouble)

let a = 1
let b = 2.0
let c = Double(a) + b
