# Day _23 - 24: 


_Follow along at https://www.hackingwithswift.com/100/swiftui/.

# 📒 Notes
- Modifier order matters
- 

WeConvert Complete            |
:-------------------------:|
![](../Assets/WeSplit_App_Pre_Challenge.png)  |


## 👨🏾‍💻 Code snippets to remember

```swift
// Views take up just as much space as they are designated
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // this frame makes this view take up all the space on the screen
        .background(Color.red)
```

```swift
// Views care about modifier order
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .background(.red)
        .frame(width: 200, height: 200)

        // is different the same as 
                VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .frame(width: 200, height: 200)
        .background(.red)
```

```swift
// Views care about modifier order
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .background(.red)
        .frame(width: 200, height: 200)

        // is different the same as 
                VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .background(.red)
        .padding()
        .background(.blue)
        .padding()
        .background(.green)
        .padding()
        .background(.yellow)
```

# 🔗 Additional related links
