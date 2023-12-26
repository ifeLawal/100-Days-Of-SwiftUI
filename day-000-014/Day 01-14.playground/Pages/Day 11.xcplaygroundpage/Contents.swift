//: [Previous](@previous)

import Foundation

// Struct control

struct BankAccount {
    private(set) var funds = 0 // Access controls
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)

let success = account.withdraw(amount: 200)

if success {
    print("Withdrawing money $$")
} else {
    print("Did not success on withdrawing")
}

// Access control levels
// private -> don't let anything outside of the struct use this
// fileprivate -> Don't let anything outside the current file us this
// public -> let anyone, anywhere use this
// private(set) -> let anyone read it, but only the onwer can set it

// static properties and methods

struct School {
    static var studentCount = 0 // exists across all Schools. Not specific to an instance
    
    static func add(student: String) { // exists across all Schools. Not specific to an instance
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "Taylor Swift")
print(School.studentCount)

// Mix and match static and non static
// Access non-static (properties and methods) from a static, it is not possible
// Accessing static (properties and methods) from a non-static is possible

// Self.studentCount -> Self with capital S means the current Typ of the struct
// self with a lowercase references the current instance
// self -> the current value of struct: 55, "Hello", true
// Self -> the current type of the struc: Int, String, Bool

struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

AppData.version

struct Employee {
    let username: String
    let password: String
    
    static let example = Employee(username: "cfdasfasd", password: "hairf0rce0ne")
}


// if the struct only has private properties than it can be defaulted
struct Doctor {
    private var currentPatient = "No one"
    private var patientRecords = ["Record 1", "Record 2"]
}
let drJones = Doctor()

// A mix of public and private methods is tricky
// An all public struct has a built in memberwise iniializer and can use the default
// A mix of public and private will not be fine with the default for the private
    // initializer is inaccessible error
struct DoctorMix {
    var name: String
    var location: String
    var currentPatient = "No one"
}
let jonesTwo = DoctorMix(name: "Esther Jones", location: "Bristol")
// let drJones = Doctor(name: "Esther Jones", location: "Bristol")

struct App {
    var name: String
    private var sales = 0
    init(name: String) {
        self.name = name
    }
}
let spotify = App(name: "Spotify")


struct NewsStory {
    static var breakingNewsCount = 0
    static var regularNewsCount = 0
    var headline: String
    init(headline: String, isBreaking: Bool) {
        self.headline = headline
        if isBreaking {
            NewsStory.breakingNewsCount += 1
        } else {
            Self.regularNewsCount += 1
        }
    }
}

// Checkpoint 6

/*
 
 To check your knowledge, here’s a small task for you: create a struct to store information about a car, including its model, number of seats, and current gear, then add a method to change gears up or down. Have a think about variables and access control: what data should be a variable rather than a constant, and what data should be exposed publicly? Should the gear-changing method validate its input somehow?
 
 */

enum CarGear {
    case up, down, neutral
}

struct Car {
    let model: String
    let numberOfSeats: Int
    private var currentGear = CarGear.neutral
    init(model: String, numberOfSeats: Int) {
        self.model = model
        self.numberOfSeats = numberOfSeats
    }
    mutating func changeGear(to newGear: CarGear) {
        currentGear = newGear
    }
}

var subaru = Car(model: "Subaru", numberOfSeats: 4)
subaru.changeGear(to: CarGear.up)
