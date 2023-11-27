//: [Previous](@previous)

import Foundation

// Arrays
var beatles = ["John", "Paul", "George", "Ringo"]
beatles.append("Adrian")
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]

let firstBeatle = beatles[0]
let firstNumber = numbers[0]
// notAllowd = firstBeatle + firstNumber

var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])

var albums = [String]() // Array<String>()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")
print(albums.count)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)

characters.remove(at: 2)
print(characters.count)

characters.removeAll()
print(characters.count)

let bondMovies = ["Casino Royale", "Spectre", "No Time to Die"]
print(bondMovies.contains("Frozen"))

let cities: [String] = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted())

let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresendets = presidents.reversed()
print(reversedPresendets)
let swifty = "Taylor Swift"
print(swifty.reversed())

// Dictionaries
var employee = ["Taylor Swift", "Singer", "Nashville"]
print("Name: \(employee[0])")
print("Job: \(employee[0])")
print("Location: \(employee[0])")

let employee2 = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]
print("Name: \(employee2["name", default: "Unknown"])")
print("Job: \(employee2["job", default: "Unknown"])")
print("Location: \(employee2["location", default: "Unknown"])")
print("Name: \(employee2["password", default: "Unknown"])")
print("Job: \(employee2["status", default: "Unknown"])")
print("Location: \(employee2["manager", default: "Unknown"])")

let hasGraduated = [
    "Eric": false,
    "Maeve": true,
    "Otis": false
]

let olumpics = [
    2012: "London",
    2016: "Rio de Janeirp",
    2021: "Tokyo"
]

print(olumpics[2012, default: "Unknown"])
var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shqauille O'Neal"] = 216
heights["LeBron James"] = 206

var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
archEnemies["Batman"] = "The Penguin"

// Sets - optimized for fast look up
var actors = Set([
"Denzel Washington",
"Tom Cruise",
"Nicolas Cage",
"Samuel L Jackson"
])
actors.insert("Angelina Jolie")
print(actors)

let sortedActorsSet: [String] = actors.sorted()
print(actors.count)


// Enum
var selected = "Monday"
selected = "Tuesday"
selected = "January" // Month
selected = "Friday " // Extra space

enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

var day = Weekday.monday
print(day)

enum Weekend {
    case saturday, sunday
}
var dayOff = Weekend.saturday
dayOff = .sunday
