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

# 🔗 Additional related links

[The Swift Language Tour Guide](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/guidedtour/)
[3 Hour Coding With Chris - YouTube Video](https://www.youtube.com/watch?v=Ulp1Kimblg0)
[String interpolation super power](https://www.hackingwithswift.com/articles/178/super-powered-string-interpolation-in-swift-5-0)
[Array vs Set](https://www.avanderlee.com/swift/array-vs-set-differences-explained/)