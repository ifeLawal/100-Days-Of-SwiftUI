//: [Previous](@previous)

import Cocoa

// Protocols

protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

protocol CanBeElectric {
    
}

struct Car: Vehicle, CanBeElectric {
    let name = "Car"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance) miles")
    }
    
    func openSunroof() {
        print("It's a nice day!")
    }
}

struct Bicycle: Vehicle {
    let name = "Bicycle"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    
    func travel(distance: Int) {
        print("I'm cycling \(distance) miles")
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a difference vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance) mi")
    }
}

let car = Car()
commute(distance: 100, using: car)
let bike = Bicycle()
commute(distance: 50, using: bike)

getTravelEstimates(using: [car, bike], distance: 100)

// Opaque return type

protocol View { }

func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber())

extension String {
    func trimmed() -> String {  // this has no mutating because it returns the modified object
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() { // mutating is required if the method modifes the actual object
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
    var isLong: Bool {
        return count > 25
    }
}

// If returning a new value end in ed, ing, etc.
// If doing in place, just use a verb (sort, reverse, etc.)
// Extensions only allow for computed properties
// Conformance grouping and purpose grouping
// Conformane grouping - making an extension of a protocol. Protocol provides the required methods and properties and the extension provides implementation
// Purpose grouping - extensions for specific tasks, which makes it easier to understand large types

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""
print(lyrics.lines.count)

struct Book {
    let title: String
    let pageCount: Int
    var readingHours: Int
}

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

struct Employee: Person {
    let name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()

// Checkpoint 8
/*
 Your challenge is this: make a protocol that describes a building, adding various properties and methods, then create two structs, House and Office, that conform to it. Your protocol should require the following:

 A property storing how many rooms it has.
 A property storing the cost as an integer (e.g. 500,000 for a building costing $500,000.)
 A property storing the name of the estate agent responsible for selling the building.
 A method for printing the sales summary of the building, describing what it is along with its other properties.
 I’ll provide some hints in a moment, but first I recommend you go ahead and try it yourself.
 */

protocol Building {
    var rooms: Int { get set }
    var cost: Int { get set }
    var estateAgent: String { get set }
}

extension Building {
    func salesSummary() {
        print("This is a building with \(rooms) rooms and costs \(cost)")
    }
}

struct House: Building {
    var rooms = 3
    var cost = 100_000
    var estateAgent = "House Sellers LLC"
}

struct Office: Building {
    var rooms = 10
    var cost = 500_000
    var estateAgent = "House Sellers LLC"
}

