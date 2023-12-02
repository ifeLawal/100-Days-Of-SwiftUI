//: [Previous](@previous)

import Cocoa

// Conditionals

/* if someCondition {
 print("Do Something")
}
*/

let score = 85

if score > 80 {
    print("Great job")
}

let speed = 88
let percentage = 85
let age = 18

if speed >= 88 {
    print("Where we're going, we don't need roads.")
}

if percentage < 85 {
    print("Sorry, you failed the test.")
}


if age >= 18 {
    print("You're eligible to vote")
}

let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}


if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}

var numbers = [1, 2, 3]
numbers.append(4)
if numbers.count > 3 {
    numbers.remove(at: 0)
}

print(numbers)

// ==

let country = "Canada"

if country == "Australia" {
    print("G'day")
}

let name = "Taylor Swift"

if name != "Anonymous" {
    print("Welcome, \(name)")
}

var username = "taylorswift13"

// String.count is costly because swfit counts every letter
if username.isEmpty {
    username = "Anonymous"
}

print("Welcome, \(username)")

// Multi conditions
/* if someCondition {
    // do something
 } else anotherCondition {
    // do something
}
 */

let ageTwo = 16

if ageTwo >= 18 {
    print("You can vote in the next election.")
} else {
    print("Sorry, you're too young to vote.")
}

let temp = 25

/*
if temp > 20 {
    if temp < 30 {
        print("It's a nice day.")
    }
}
*/

if temp > 20 && temp < 30 {
    print("It's a nice day.")
}

let userAge = 24
let hasParentsConsent = true

if age >= 18 || hasParentsConsent {
    print("You can buy the game!")
}

enum TransportOption {
    case airplane, helicopter, bicycle, car, escooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there is a bike path...")
} else if transport == .car {
    print("Time to get stuck in traffic.")
} else {
    print("I am going to hire a scooter now!")
}

//

enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

if forecast == .sun {
    print("It's a sunny day")
} else if forecast == .rain {
    print("Pack an umbrella")
} else if forecast == .wind {
    print("Brrr, strong headwinds are coming")
} else if forecast == .rain {
    print("Bundle up")
} else {
    print("Forecaster down :__;")
}

switch forecast {
case .sun:
    print("It's a sunny day")
case .rain:
    print("Pack an umbrella")
case .snow:
    print("Bundle up")
case .wind:
    print("Brrr, strong headwinds are coming")
case .unknown:
    print("Forecaster down :__;")
}

let direction = "South"

switch direction {
case "South":
    print("Goin doing south")
default:
    print("Not sure where you are going")
}


let day = 5

switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}

// Ternary conditional

let myAge = 18
let canVote = age >= 18 ? "Yes" : "No" // Ternary - a condensed if statement. WTF Pneuomnic

print(canVote)

let hour = 23

print(hour < 12 ? "It's before noon" : "It's after noon")

let names = ["Jayne", "Kaylee", "Mal"]
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"

enum Theme {
    case light, dark
}

let theme = Theme.dark

let background = theme == .dark ? "black" : "white"
print(background)

if theme {
    print("We have a theme")
}
