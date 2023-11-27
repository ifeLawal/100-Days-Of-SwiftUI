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


// Checkpoint
/*
 Your goal is to write a Swift playground that:

 Creates a constant holding any temperature in Celsius.
 Converts it to Fahrenheit by multiplying by 9, dividing by 5, then adding 32.
 Prints the result for the user, showing both the Celsius and Fahrenheit values.
 */
let tempInCelsius = 0
let tempInFahrenheit = (tempInCelsius * 9 / 5) + 32
print("Temperature in celsius is: \(tempInCelsius) and that temperature in Fahrenheit is: \(tempInFahrenheit)")
