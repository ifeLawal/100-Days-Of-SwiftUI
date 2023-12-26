//: [Previous](@previous)

import Foundation

// Classes

// Similarities with structs
// You get to create and name them
// Add properties, methods, property observers, and access contorl
// Create custom initializersto configure new instances

// Differences from structs
// You can make a class build upon funcionality in another class
// Swift won't generate a memberwise initializer for classes
    // Give defaults or make an initializer
// If you copy an instance of a class, both copies share the same data
// We can add a deinitializer to run when the final copy is destroyed
// Constant class instances can have their variable properties changed


// Class
class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I'm working for \(hours) hours a day.")
    }
}

class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day.")
    }
}
// final means nothing can inherit this class, but it can inherit from others
final class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()

class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

// if no new initialize defined in a sub class than the inherited initializer will work
class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)

// Copying classes - reference types
class User {
    var username = "Anonymous"
}

var user1 = User()
var user2 = user1
user2.username = "Taylor"
print(user1.username)
print(user2.username)

class Coffee {
    var name = "Machioto"
    
    func copy() -> Coffee {
        let coffee = Coffee()
        coffee.name = name
        return coffee
    }
}

var coffee1 = Coffee()
var coffee2 = coffee1.copy()
coffee2.name = "Cold Brew"

// Deinitializers
// You do not use func with deinitializer
// Deinitializers can never take paratmerters or return data
// Deinitialziers run when the last copy of a class instance is destroyed
// We never call deinitielaizer directly
// Structs don't have deinitializers

// Copying classes - reference types
class UserDeinit {
    var username = "Anonymous"
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }
    
    deinit {
        print("User \(id): I'm dead!")
    }
}

var users = [UserDeinit]()

for i in 1...3 {
    let userD = UserDeinit(id: i)
    print("User \(userD.id)! I'm in control!")
    users.append(userD)
}
print("Loop is finished!")
users.removeAll()
print("Array is clear!")

/*
 Your challenge is this: make a class hierarchy for animals, starting with Animal at the top, then Dog and Cat as subclasses, then Corgi and Poodle as subclasses of Dog, and Persian and Lion as subclasses of Cat.
 */
class Animal {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("Bark bark")
    }
}

class Corgi: Dog {
    override func speak() {
        print("Corg bark")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Pood bark")
    }
}

class Cat: Animal {
    var isTame: Bool
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
    func speak() {
        print("Meow meow")
    }
    
}

class Persian: Cat {
    override func speak() {
        print("Purr purr")
    }
}

class Lion: Cat {
    override func speak() {
        print("Roar roar")
    }
}

var sandyPersian = Persian(isTame: false)
