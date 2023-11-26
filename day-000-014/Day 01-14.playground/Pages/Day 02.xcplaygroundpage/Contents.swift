import Cocoa

// Booleans
let filename = "paris.jpg"
print(filename.hasSuffix(".jpg"))

let goodDogs = true
var gameOver = false
print(gameOver)
gameOver.toggle()
print(gameOver)
let isMultipleOfThree = 120.isMultiple(of:3)


var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)

// String concatenation / interpolation
let firstPart = "Hello, "
let secondPart = " world"

let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action
let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)

let number = 11
let missionMessage = "Apollo " + String(number) + " landed on the moon"
let interpolationMessage = "Apollo \(number) landed on the moon"

print("5 * 5 = \(5 * 5)")
