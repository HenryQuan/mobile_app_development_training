# IOS Bootcamp

I am skipping some early sections because I already know most of them and there is no point of writing down any notes.

## Section 4: Collections, Constants & Variables

- `randomElement()` on array to replace `int.random(range())`
- `...` is a `range operator`, you can also `..<` and more

## Section 6: Auto Layout and Responsive UIs

This is quite important and I think it is similar to android's `constraint layout`. For react native or flutter, it is a bit different like how they layout UIs.

- `super view` (the entire view) and `safe area` (for iphone X+)
- `UIStackView` is like a normal `View` in react native or `Row/Column` in flutter, people say it is not efficient but I don't know. I prefer layout my views like that, I think react native uses `yoga`.

## Section 7: Apple Documentation

- Searcing online is really important as a programmer
- I used `tag` but Angela used `button.currentTitle`. It also works and actually quite creative for me
- I would avoid `!` if possible but for this app, it is fine
- `DispatchQueue.main.asyncAfter` for delay, async I guess

## Section 8: Control Flow and Optionals

It is focusing on `if else`, `switch`, `dictionary` and optionals. I was a bit confused about optionals before back in 2014. Now, I understand what it means. I was a bit too young to understand maybe.

- For `switch`, you can use a range operator, `80...100` for a ranged value. This is really powerful and another languages cannot do this because it must be a constant. However, swift supports range
- `?!` optionals is like `maybe` in haskell. The data is in a box and you don't know what's inside. That's why you put a `?` and you can use `!` to force unwrap it but it might be nil. It is good to check if it is nil or not before using it. Also, avoid using `!` unless you are 100% sure that it won't be nil
- `Timer.scheduledTimer` for a periodic timer

## Section 9: Design Patterns and Code Structuring

This is really important for development because it is useful not only for iOS but almost everything UI related

- Custom data type, struct

```swift
// This is a simple model
struct Town {
    let name: String = "Henry"
    var citizens: [String] = ["Henry"]
    var resources: [String: Int] = ["Ore": 42, "Wood": 100]

    // You can also add functions
    func xxx() {

    }
}

let t = Town()
// Then you can t.name and more
```

- The difference between a `class` and a `struct` is that `class` is a `reference type` but `struct` is a `value type` like `Int`. Class also supports inhertitance so struct is basically for a simple data type / data model
- `MVC`, model-view-controller. `Design patterns` are great to solve many common problems. It is not a problem if the app is small but when it gets larger, it will cause lots of problems
  - There is no single pattern that is good for use cases
  - `Model`, data & logic
  - `View`, the user interface
    - It doesn't talk to the model directly and only interact with data through the controller
  - `Controller`, handles events and touch
  - `MVC` is good for reducing duplications

```swift
func name(a b: String)
// a is visible outside and b is visible inside
```

- `mutating func xxx` lets your update the structure. It is my first time ever knowing this... since struct is a value type so it is a bit troublesome

## Section 10: iOS App Design Pattern Challenge

## Section 11: Advanced Swift Programming - Classes, Inheritance & Advanced Optionals

- `Class` doesn't have a default constructor with all fields but `struct` does
- You need `mutating` to update a `struct`
- `Class` is a reference but `struct` is a value like `int, double and more`
- `Struct` is like a simple `class` so no inheritence and many more fancy features
- `Struct` first and use `class` if you need more features
- `Struct` is immature and passed by value but `class` is passed by reference and can be inherited

### Write UI with code or storyboard

You just need to create it and remember to add it to `view`. So code or StoryBoard? I think they are both useful. For simple screens, it is fine to use storyboard but for really complicated screens, it might be a bit challenging to use storyboard. I tried it before and yes, it was hard. I think this is why you need to code the UI. Also, for a team, it might be better to code the UI because storyboard generates random ids and there will be lots of problems

### Optionals

They are useful because sometimes, we can `nil` values. Use `!` to force unwrap the value but it can crash if it is a null. Consider this. You have a box but you don't know what's inside. It can have something or nothing inside. That's why it is always good to check if there are things inside.

```swift
// Optional Binding
if let safeOptional = optional {
    safeOptional
    // and more
}

// Use default value if nil
optional ?? defaultValue
```

## Section 12: Advanced Swift Programming Challenge

## Section 13: Networking, JSON Parsing, APIs and Core Location

This section is interesting and is very important because you will need to deal with Networking and JSON a lot in the future.

- `Delegate`, I still remember when I first started making iOS apps. There were so many delegates and I couldn't understand but now it is clear. You have delegate so that the controller can control the view. That's why you set `xxx.delegate = self`
  - Apple uses a lot of `delegates` and I don't know if this is good or bad
  - It feels like an `interface` but maybe not
  - Struct can also implement an interface which is great
  - You can implement multiple protocols like interface
- `Delegate design pattern`, another design pattern! Basically, you can have a few features that are not implemented but you have lots of default behaviours. You let another classes to implement it and this way, maximise code reuse and also seperate UI from logic. This is also Apple's favourite :)
- `API`, application programming interface (making software with interface with internal system). We were using `OpenWeather` for the weather app.
- `Networking`, request data to a web server. In Swift, we use a URLSession from a URL. The first time I saw a callback, I was confused and wondered why it was not returning anything. A callback is basically just a function. If it takes a long time to get the result, the program will keep running and call that function when the processing has been completed.
- `Closure` is a function (lambda). You can pass a function into another function and also return a function. It is a higher order function (I think this is the name). Swift is a functional programming language so there are a lot of lambda functions.

```swift
// A simple closure
function(1, 2, { (a, b) -> Int in
    return a + b
})

// Same as above
function(1, 2, { (a, b) in a + b })

// Same as above
function(1, 2, { $0 * $1 })

// Still the same, the magic of Swift
function(1, 2) { $0 * $1 }

// You can use map, filter, reduce to simplify many complicated tasks
// I cannot remember if you can write closures like this in Swift 2.0
```

- `JSON` is really popular (JavaScript OP) but `XML` is catching up. Implement `Decodable` to decode JSON string to a Swift data type. I can use my tool to generate Swift structures.

```swift
// Computed property
var conditionName: String {
    return getConditionName(weatherId: conditionId)
}
```

### How to pass data back?

The data is now only available inside the closure but with `delegate pattern`, you can get it out by calling the protocol function.

- `typealias` Codable = Decodable & Encodable, you can combine two types together
- Put the protocol in the same file as the delegate so don't create another file (If you think about it, there will be so many files if you create a file for every protocol)
- `Internal and external parametre`, this is useful because the external name can be long and descriptive whereas the internal name can be shorter. Before, Objective-C couldn't do this so function names were quite lengthy.
- You use external names to make the function name more English like. For example, `func didFailed(with error: Error)` is better than `func didFailedWithError(error: Error)` because `error` is repeated twice.
- `DispatchQueue.main.async` is essential for updating UI from a closure (async).

### Extensions
You can provide `default behaviours` for `protocols` or adding `extra functions` for an existing type or class. This is quite useful because you have access to the internal `self`. You can also use it to extend to UIKit and have some handy functions. In the end, you could reuse code and make complicated tasks simplier.
~~~swift
extension Double {
    func round(to places: Int) {
        let precision = pow(10, Double(places))
        var temp = self
        return (temp * precision).round() / precision
    }
}
~~~
- By using extensions, you can also seperate implementations for delegates so you main view controller will have less codes and it is easier to manage. This results in improved readablity.
- Use `// MARK: - xxx` to seperate the file into multiple sections.
- `CoreLocation` to get current location
