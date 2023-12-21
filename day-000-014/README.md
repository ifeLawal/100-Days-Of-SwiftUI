# Day 1 - 14: _From variables to nil coalescing


_Follow along at https://www.hackingwithswift.com/100/swiftui/1.

# 📒 Notes

These 14 days cover essential programming topics needed to complete the [100 Days of SwiftUI Challenge](https://www.hackingwithswift.com/100)

It focuses on:

- Using MacOs Playground to create a basic code editor for getting started
- Variables
- Arrays, dictionaries, sets, enums
- if, conditionals, loops
- functions, parameters, error handling
- closures, computed properties, methods
- classes, inheritance
- protocols, optionals

## General reminders

- Swift Playground can be launched via Xcode, through File menu and choosing New > Playground > macOs > blank
- Swift is camelCase
- lets are constants, var are changeable variables
- Swift comparisons go across integers, strings, dates, and event enums (enums go by order of the case)
- Conditional for swift is one to one in comparison to other coding languages
    - if you have a coding background it will be easy. if not absorb it and continue since it will come with time
- Swift enums are very powerful
- Swift Switch statements by default break once the case is true
    - you can continue a Switch statement using fallthrough
    - Swift with multiple conditions wraps the first && together
- ternary operators are useful in cases where you need the condition passed to a parameter
- Swift has a concept called Closures, which is similar to Javascript Promises

## Toughest quiz questions

- Quizzes are worth doing to strengthen code reading capability

```Swift
import Cocoa

/* Conditional quiz questions can be tough for new coders. Things to be aware of:
    comparing different types
    case sensitivity for words / letters
    checking spelling
    non-boolean types need a comparison / check that leads to a boolean
    booleans by themselves evaluate directly to true or false
*/
var actualWage: Int = 22_000
var medianWage: Double = 22_000
var wages: [Int] = [22_000]
if actualWage >= medianWage {
	print("Success")
} // fails due to incorrect type checks

if actualWage {
    print("Wage exists")
} // fails because Int does not evaluate out to a boolean

if actualWage == wages {
    print("Success")
} // fails due to incorrect types. it's an array compared with an integer

```

Loops trick questions
```Swift
for beatle in "John", "Paul", "Ringo" { // commas do not equal array. The [] are needed
	print("\(beatle) was in the Beatles")
}

// IE
for beatleMember in ["John", "Paul", "Ringo"] {
    print("\(beatleMember) was in the Beatles")
}

var numbers = [1, 2, 3, 4, 5, 6]
for number in numbers {
	if number % 2 == 0 { // Modulo gives a remainder value.
		print(number)
	}
}

var speeds = (65, 58, 72)
for speed in speeds { // You cannot loop over a tuple like this
	print("You were driving at \(speed)km/h.")
}

while 0 < 5 { // Beware of infinite loops!!
	print("I'm counting to 5!")
}

let bottles = 10 // Beware of data types. Constants can't change
while bottles > 0 {
	bottles -= 2
	print("\(bottles) green bottles.")
}
```

## Code snippets to remember

The subtle difference between an array and a dictionary
```swift
import Cocoa

var employee = ["Taylor Swift", "Singer", "Nashville"] // Array
print(employee[0])
var employee2 = ["name": "Taylor Swift", "job": "Singer", "location": "Nashville"] // Dictionary
print(employee2["location", default: "Unknown"])
```

The structure for an enum
```swift
import Cocoa

enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.monday
day = .tuesday
```

Switch statements
```Swift
import Cocoa
enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

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
```

Sets are formed from arrays
```swift
import Cocoa

var earthquakeStrengths = Set(1, 1, 2, 2) // not a valid set because the integers are not in an array
var names = Set(["Sean", "Paul"]) // valid set
```

Swift conditionals are the same as in other programming languages. So if you have coded before this section is easy to pick up.
```swift
import Cocoa 

if someCondition && otherCondition {

} else if newCondition || differentCondition {

} else {

}
```

Swift ternary operator
```Swift
import Cocoa

print(hour < 12 ? "It's before noon" : "It's after noon")
```

For and while loops
```Swift
import Cocoa

let platforms = ["iOS", "macOs", "tvOs", "watchOS"]

for os in platforms {
    print("Swift works great on \(os).")
}

// Underscore if item is not used
var lyric = "Haters gonna"

for _ in 1..<5 { // < sign to specify not inclusive
    lyric += " hate"
}

```

Using range to access arrays
```Swift
import Cocoa

let names = ["Piper", "Alex", "Suzanne", "Gloria"]

print(names[0])

print(names[1...3])

print(names[1...])
```

Swift loop labels
```Swift
import Cocoa
// Day 06 - the outerLoop labels the initial loop to use in the inner loop break
outerLoop: for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In loop")
            let attempt = [option1, option2, option3]

            if attempt == secretCombination {
                print("The combination is \(attempt)!")
                break outerLoop // referencing breaking the outerLoop
            }
        }
    }
}
```


```swift
// Day 07 - Switch statement for integers can be covered using the ... range
func buyCar(price: Int) {
	switch price {
	case 0...20_000:
		print("This seems cheap.")
	case 20_001...50_000:
		print("This seems like a reasonable car.")
	case 50_001...100_000:
		print("This had better be a good car.")
    default:
        print("Yes!")
	}
}
```

```swift
// Day 08
do {
    try someRiskyWork()
 } catch {
    print("Handle Error")
 }
```

```swift
// Day 09 Closure
// Basic closure is a variable storing a function
let sayName = { (name: String) -> String in
   "Hi \(name)"
}
let team = ["Gloria", "Suzanne", "Piper", "Tifanny", "Tasha"]


// A full closure definition with a return, paramaters, etc.
let capSortedTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
})

// Middle of the road shorthand closure
let sorted = team.sorted { a, b in
    if a == "Suzanne" {
        return true
    } else if b == "Suzanne" {
        return false
    }
    
    return a < b
}

// Full shorthand closure
let tOnly = team.filter { $0.uppercased().hasPrefix("T") }

// Functions that take function params
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    
    return numbers
}
```

# 🔗 Additional related links

[The Swift Language Tour Guide](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/guidedtour/)
[3 Hour Coding With Chris - YouTube Video](https://www.youtube.com/watch?v=Ulp1Kimblg0)
[String interpolation super power](https://www.hackingwithswift.com/articles/178/super-powered-string-interpolation-in-swift-5-0)
[Array vs Set](https://www.avanderlee.com/swift/array-vs-set-differences-explained/)
[Ranges in Swift by Antoine van der Lee](https://www.avanderlee.com/swift/ranges-explained/)