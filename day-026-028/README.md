# Day _26 - 28: BetterRest


_Follow along at https://www.hackingwithswift.com/100/swiftui/26.

# 📒 Notes
- This introduces Create ML and Core ML which is built into swift
- 

WeConvert Complete            |
:-------------------------:|
![](..)  |


## 👨🏾‍💻 Code snippets to remember

```swift
// Steppers - used for incrementing over a number range

@State private var sleepAmount = 0.0 // Crucial that you are intentional with this data type. It will need to be the same as the stepper

Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                .padding(20) // formatted smoothens the look
```

```swift
// Dates
@State private var wakeUp = Date.now

DatePicker("Please select a date", selection: $wakeUp, in: Date.now...).labelsHidden()
            // label Hidden hides the text, while still allowing screen readers to read it
            // an alternative to in is using displayedComponents
            // displayedComponents: .hourAndMinute

func exampleDates() {
    let tomorrow = Date.now.addingTimeInterval(86400) // 86400 is 1 day in seconds
    let range = Date.now...tomorrow
}
```

```swift
// 3 different ways to go about date
Text(Date.now, format: .dateTime.hour().minute())

var components = DateComponents()
components.hour = 8
components.minute = 0
let date = Calendar.current.date(from: components) ?? .now // Calendar current returns an optional
Text(Date.now.formatted(date: .long, time: .shortened))

```

```swift
// Dates
func exampleDates() {
    var components = DateComponents()
    components.hour = 8
    components.minute = 0
    let date = Calendar.current.date(from: components) ?? .now // Calendar current returns an optional
    
    let tomorrow = Date.now.addingTimeInterval(86400) // 86400 is 1 day in seconds
    let range = Date.now...tomorrow
    
    let newComponents = Calendar.current.dateComponents([.hour, .minute], from: .now)
    let newHour = newComponents.hour ?? 0
    let newMinute = newComponents.minute ?? 0
    
}
```


```swift
// Create and Core ML
// Steps to getting to the ML page
// open XCode -> click upper left hand XCode navigation
// in the options hover to "Open Developer Tool" -> select Create ML
// Here you can "Create a New Project" from a list of ML templates
// Or Open previous projects
// For further breakdown on the models and templates soo the Create ML for Everyone video
```

# 🔗 Additional related links
[Create ML for Everyone by Paul Hudson](https://www.youtube.com/watch?v=a905KIBw1hs)