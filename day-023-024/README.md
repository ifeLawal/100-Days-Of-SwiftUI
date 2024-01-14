# Day _23 - 24: 


_Follow along at https://www.hackingwithswift.com/100/swiftui/23.

# 📒 Notes
- Modifier order matters
- ViewBuilder and TupleViews happen under the hood for Swift UI to return multiple nested Views and Views that are side by side so developers can just use the views
- Utilize spacers to get the right proportions for content across different screen sizes
- This technique lesson focuses on understanding structs and ways to build out more complex interfaces


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
// Conditional Modifiers - preferred over using if else logic. if else logic creates multiple views
    @State private var useRedText = false

        var body: some View {
            Button("Hello, world!") {
                useRedText.toggle()
            }
            .foregroundStyle(useRedText ? .red : .blue)
        }
```

```swift
// Environment Modifiers - styles that go on children views
        var body: some View {
            VStack {
                Text("Gryffindor")
                    .font(.largeTitle)
                Text("Hufflepuff")
                Text("Ravenclaw")
                Text("Slytherin")
            }
            .font(.title) // this will modify all the styles in children
            .blur(radius: 5) // blur is a regular modifier and it's modifiers are added to VStack
        }
```

```swift
// View as properties - styles that go on children views
        let motto1 = Text("Draco dormiens")
        let motto2 = Text("Lorem ipsum")
        var motto3: some View { // computed
            Text("New motto")
        }

        // @ViewBuilder var spells: some View {
        var spells: some View {
            // Group {  an option for multiple views
            VStack {
                Text("Hello")
                Text("World")
            }
        }

        var body: some View {
            VStack {
                motto1
                    .foregroundStyle(.red)
                motto2
                    .foregroundStyle(.blue)
            }
            .padding()
        }
```

```swift
// Composition - views that layer on other modifiers
// combining smaller views into bigger ones
struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            // .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            CapsuleText("First")
                .foregroundStyle(.white)
            CapsuleText("Second")
                .foregroundStyle(.lightgreen)
        }
    }
}
```

```swift
// Custom modifiers - using View extension you can create your own modifiers
// you can have parameters alongside it if you define a ViewModifier struct
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(Rectangle(cornerRadius: 10))

    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content

            Text(text)
                .font(.largeTitle)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Color.blue
                .frame(width: 200, height: 200)
                .watermarked(with: "Hacking with Swift!")
            Text("Hello, world!")
                // .modifier(Title())
                .titleStyle()
        }
    }
}

```

```swift
// Custom containers - very complex and likely not to be used often
// Generics, any content can be passed as long as it is a view
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    // ViewBuilder let content: (Int, Int) -> Content

    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            HStack { // can remove this if @ViewBuilder in place
                Image(systemName: "\(row * 4 + col).circle")
                Text("R\(row) C\(col)")
            }
        }
    }
}

```

# 🔗 Additional related links
