# Day _23 - 24: 


_Follow along at https://www.hackingwithswift.com/100/swiftui/23.

# 📒 Notes
- Modifier order matters
- ViewBuilder and TupleViews happen under the hood for Swift UI to return multiple nested Views and Views that are side by side so developers can just use the views
- Utilize spacers to get the right proportions for content across different screen sizes

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
        .frame(maxWidth: .infinity, maxHeight: .infinity) // this frame makes this view take up all the space on the screen otherwise the background would be a small box space
        .background(Color.red)
```

```swift
// Views care about modifier order
// Below
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .background(.red)
        .frame(width: 200, height: 200)

        // is different from below
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
// Some view allows iOs to understand the wrapped struct object being returned
    var body: some View {
        Button("Hello, world!") {
            print(type(of: self.body)) // self.body provides the underlying type which includes the modifiers
        }
        .frame(width: 200, height: 200)
        .background(.red)
        // for example, this prints out:
        // ModifiedContent<ModifiedContent<Button<Text>, _FrameLayout>, _BackgroundStyleModifier<Color>>
    }
```

```swift
// You can return a specific type of view yourself, but this is not so easy when you have nested and multiple view types
    var body: Text {
        Text("Hello world!")
    }
```

```swift
// Modifiers can be stacked
// Below adds 4 padding layers that are at each others edge
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

```swift
// Conditional Modifiers
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
