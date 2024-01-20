# Day _29 - 31: WordScramble


_Follow along at https://www.hackingwithswift.com/100/swiftui/29.

# 📒 Notes
- We learned how to use List for working with tables of data
- We learned how to load non-image data like txt, jsom, xml files
- We learned about UITextChecker which comes from UIKit and is used for text validations
- We put guard, nil coalescing, and optionals to use
- There was also new navigation modifiers like `onSubmit` and `onAppear`.

WordScramble Complete            |
:-------------------------:|
![](../day-029-031/WordScramble.png)  |


## 👨🏾‍💻 Code snippets to remember

```swift
// General List
// Similar in look to a form
List {
    Text("Hello World")
    Text("Hello World")
    Text("Hello World")
}
```

```swift
// Dynamic rows in a List
// This is also do able in a form
List {
    ForEach(0..<5) {
        Text("Dynamic row \($0)")
    }
}
```

```swift
// You can mix and match dynamic and static fields
// Dynamic and static mixing is also possible in a form
List {
    Section("Static Section 1") {
        Text("Static row 1")
        Text("Static row 2")
    }

    Section("Dynamic Section 1") {
        ForEach(0..<5) {
            Text("Dynamic row \($0)")
        }
    }

    Section("Static Section 2") {
        Text("Static row 3")
        Text("Static row 4")
    }
}
.listStyle(.grouped) // modifier also available for form
```

```swift
// List has a unique way to form an entire list made up of dynamic rows
List(0..<5) {
    Text("Dynamic row \($0)")
}

let people = ["Finn", "Leia", "Luke", "Rey"] // Array of values

List(people, id: \.self) { // id: self lets the list identify each field uniquely 
    Text($0)
}
```

```swift
func testBundles() {
    if let fileUrl = Bundle.main.url(forResource: "somefile", withExtension: "txt") {
        // we found the file in our bundle!
        // below is an optional throw: try? 
        if let fileContents = try? String(contentsOf: fileUrl) {
            // we loaded the file into a string
        }
    }
}
```

```swift
// This method goes over ways to work with a string in swift to see if it is misspelled
func testStrings() {
    let input = "a b c"
    let inputTwo = """
    a
    b
    c
    """
    let letters = input.components(separatedBy: " ")
    let lettersTwo = input.components(separatedBy: "\n")
    let letter = letters.randomElement()
    let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines) // removes all white spaces and new lines
    // anything that starts with UI comes from UIKit
    // written in the older language of objective C
    // checking for misspelled words
    let word = "swift"
    let checker = UITextChecker() // Objective C does not store strings and emojis together
    let range = NSRange(location: 0, length: word.utf16.count) // utf16 is used as a character encoder representing storing letters in a string. It lets Objective C understand how swift stores the strings
    let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en") // Objective C has no optionals, so it could have an NSRange that is empty or NSNotFound
    
    let allGood = misspelledRange.location == NSNotFound
}
```

```swift
// "guard let" runs code if the optional doesn't have a value
guard answer.count > 0 else { return }
```

# 🔗 Additional related links
