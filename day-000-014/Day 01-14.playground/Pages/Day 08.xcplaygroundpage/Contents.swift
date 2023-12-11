//: [Previous](@previous)

import Cocoa

// default paramaters

func printTimesTables(for number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(number * i)")
    }
}

printTimesTables(for: 5, end: 20)

func printTimesTableWithDefault(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(number * i)")
    }
}

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll(keepingCapacity: true)
print(characters.count)

// Error handling

enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 { throw PasswordError.short }
    if password == "12345" { throw PasswordError.obvious }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

/*
 do {
    try someRiskyWork()
 } catch {
    print("Handle Error")
 }
 */

let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch {
    print("There was an error.")
}

/*
 Use when you know there is no error going to happen. Used rarely
 
 let result = try! checkPassword(string)
 print("There was an error.")
 */

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same comibination on my luggage!.")
} catch {
    print("There was an error.\(error.localizedDescription)")
}


// Checkpoint challenge
/*
 The challenge is this: write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number. That sounds easy, but there are some catches:

 You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.
 If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.
 You should only consider integer square roots – don’t worry about the square root of 3 being 1.732, for example.
 If you can’t find the square root, throw a “no root” error.
 */

enum SquareRootError: Error {
    case noRoot, outOfBounds
}

func integerSqrt(of number: Int) throws -> Int {
    if number < 1 || number > 10_000 {
        throw SquareRootError.outOfBounds
    } else {
        var sqrtInteger = 1
        while sqrtInteger * sqrtInteger < 10_000 {
            if sqrtInteger * sqrtInteger == number {
                return sqrtInteger
            }
            sqrtInteger += 1
        }
        throw SquareRootError.noRoot
    }
}

print()
do {
    let sqrtInt = try integerSqrt(of: 144)
    print(sqrtInt)
} catch {
    print("There was an error")
}
