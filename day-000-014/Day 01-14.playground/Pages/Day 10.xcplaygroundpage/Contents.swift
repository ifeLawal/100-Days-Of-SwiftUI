//: [Previous](@previous)

import Foundation


// Structs

struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.title)

red.printSummary()
wings.printSummary()

struct Employee {
    let name: String
    var vacationRemaining: Int = 14
    
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

struct AnonyousEmployee {
    let name: String = "Anonymous"
    var email: String
}

var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
let unknown = AnonyousEmployee(email: "unknown@hidden")
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

let a = 1
let b = 2.0
let c = Double(a) + b

let kane = Employee(name: "Lana Kane")
let poovey = Employee(name: "Pam Poovey", vacationRemaining: 35)

// Struct computed properties

struct EmployeeSimple {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var newArcher = EmployeeSimple(name: "Sterling Archer")
newArcher.vacationTaken += 4
print(archer.vacationRemaining)
newArcher.vacationTaken += 4
print(newArcher.vacationRemaining)
newArcher.vacationRemaining = 5
print(newArcher.vacationAllocated)

// Property observer

struct Game {
    var score = 0 {
        didSet {
            // oldValue
            print("Score is now \(score)")
        }
        // will set
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 3

struct App {
    var contacts = [String]() {
        // Sets are good for animations
        // Don't put too much work into the property observer
        // It can cause performance problems
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue) ")
        }
        didSet {
            print("There are now \(contacts.count) contacts")
            print("Old value was: \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Adrian W")
app.contacts.append("Ish S")

// Custom initializers
struct Player {
    let name: String
    let number: Int
    
    // Once you create a custom initializer you lose the default init
    init(name: String) {
        self.name = name
        // self.number = number
        self.number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Megan R")
