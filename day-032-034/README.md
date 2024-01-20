# Day _32 - 34: Animations

_Follow along at https://www.hackingwithswift.com/100/swiftui/32.

# 📒 Notes
-  you’ll learn about implicit animations, explicit animations, binding animations, and more
- there are two types of implicit animations. You can 1. animate the view or 2. animate the state change. In the former, the state change has no idea it will trigger an animation, and in the latter the view has no idea it will be animated – both work and both are important.

WeConvert Complete            |
:-------------------------:|
![](..)  |


## 👨🏾‍💻 Code snippets to remember

```swift
// animations get auto interpolated on modifier value changes
// the .animation modifier is a great way to add an implicit animation. It eases into the change when a property changes, but animates across all properties that change
    Button("Tap me") {
        animationAmount += 1
    }
    .padding(50)
    .background(.red)
    .foregroundColor(.white)
    .clipShape(Circle())
    .scaleEffect(animationAmount)
    .blur(radius: (animationAmount - 1) * 3)
    .animation(
        .spring(duration: 1, // duration is in seconds
         bounce: 0.9), // bounce goes from 0 - 1
         value: animationAmount
    ) // animation modifier
    // first paramater has a wide range
```

```swift

Button("Tap me") {
    animationAmount += 1
}
.animation(
    .easeInOut(duration: 1)
    .delay(1), // animations can have modifiers as well,
    value: animationAmount
)
```

```swift
// repeat count can let you create a forever oscillating ring
Button("Tap Me") {
    // animationAmount += 1
}
.padding(50)
.background(.red)
.foregroundColor(.white)
.clipShape(Circle())
.overlay(
    Circle()
        .stroke(.red)
        .scaleEffect(animationAmount)
        .opacity(2 - animationAmount)
        .animation(
            .easeOut(duration: 1)
                .repeatForever(autoreverses: false),
            value: animationAmount
        )
)
.onAppear {
    animationAmount = 2
}
```

```swift
// you can also animate the value animation is bound to
// when you hit the stepper the scaling up will animate since the value is modified by .animation() where as the button will just scale it without an animation
VStack {
            Stepper("Scale amount", value: $animationAmount.animation(
                .bounce(duration: 1, spring: 0.3)
            ), in: 1...10)

            Spacer()

            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
        }
```

```swift
// explicit animations
@State private var animationAmount = 0.0

Button("Tap Me") {
    // explicit animation just means you are telling the state that will change to animate the value change from it's initial state to the desired state
    withAnimation(.spring(duration: 1, bounce: 0.5)) {
        animationAmount += 360
    }
    // do nothing
}
.padding(50)
.background(.red)
.foregroundStyle(.white)
.clipShape(.circle)
.rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
```
# 🔗 Additional related links
