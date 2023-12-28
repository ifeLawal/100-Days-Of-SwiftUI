# Day 16 - 18: _Project 1: WeSplit_, Part One - Three


_Follow along at https://www.hackingwithswift.com/100/swiftui/16_.

# 📒 Notes
- Day one goes through Form, NavigationStack, @State, Buttons, Picker, and 
- Day two involved putting those items together to build out the WeSplit application

<img src="./Assets/WeSplit_App_Pre_Challenge.png" width="88px" />

## Code snippets to remember

```swift
// below code goes inside of a ContentView
// it returns a NavigationStack view that has a title "SwiftUI" in the middle and a small "Hello, world!" section
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("Hello, world!")
                }
            }.navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
```

```swift
// @State properties
struct ContentView: View {
    @State var tapCount = 0 // @State allows us to modify properties without using the mutating

    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1 // action to be taken when the button is pressed
        }
    }
}
```

```swift

// code inside a ContentView
@State private var name = "" // Two way binding
    
var body: some View {
    Form {
        TextField("Enter your name", text: $name) // $property means it can be read and written
        Text("Hello, \(name)!")
    }
}
```

```swift
// 
let students = ["Harry", "Hermione", "Ron"]
@State private var selectedStudent = "Harry" // Two way binding

var body: some View {
    NavigationStack {
        Form {
            Picker("Select your student", selection: $selectedStudent) {
                ForEach(students, id: \.self) { // .self is needed to know how to identify each item
                    Text($0)
                }
            }
        }
    }
}
```

```swift
// Locale is a built in struct in iOs to read properties on a users device
TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
```

# 🔗 Additional related links
[Picker Apple Documentation](https://developer.apple.com/documentation/swiftui/picker)
[Navigation Stack Documentation](https://developer.apple.com/documentation/swiftui/navigationstack)
[TextField Documentation](https://developer.apple.com/documentation/swiftui/textfield)
[State Documentation](https://developer.apple.com/documentation/swiftui/state)
[ForEach Documentation](https://developer.apple.com/documentation/swiftui/foreach)
[FocusState Documentation](https://developer.apple.com/documentation/swiftui/focusstate)
[Section Documentation](https://developer.apple.com/documentation/swiftui/section)