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
- 

## Toughest quiz questions

- Quizzes are worth doing to strengthen code reading capability

```Swift

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

# 🔗 Additional related links

[The Swift Language Tour Guide](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/guidedtour/)
[3 Hour Coding With Chris - YouTube Video](https://www.youtube.com/watch?v=Ulp1Kimblg0)
[String interpolation super power](https://www.hackingwithswift.com/articles/178/super-powered-string-interpolation-in-swift-5-0)
[Array vs Set](https://www.avanderlee.com/swift/array-vs-set-differences-explained/)