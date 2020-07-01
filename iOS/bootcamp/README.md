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
~~~swift
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
~~~
- The difference between a `class` and a `struct` is that `class` is a `reference type` but `struct` is a `value type` like `Int`. Class also supports inhertitance so struct is basically for a simple data type / data model
- `MVC`, model-view-controller. `Design patterns` are great to solve many common problems. It is not a problem if the app is small but when it gets larger, it will cause lots of problems
    - There is no single pattern that is good for use cases
    - `Model`, data & logic
    - `View`, the user interface
        - It doesn't talk to the model directly and only interact with data through the controller
    - `Controller`, handles events and touch
    - `MVC` is good for reducing duplications
~~~swift
func name(a b: String)
// a is visible outside and b is visible inside
~~~
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
~~~swift
// Optional Binding
if let safeOptional = optional {
    safeOptional
    // and more
}

// Use default value if nil
optional ?? defaultValue
~~~

## Section 12: Advanced Swift Programming Challenge

## Section 13: Networking, JSON Parsing, APIs and Core Location
This section is interesting and is very important because you will need to deal with Networking and JSON a lot in the future.
- `Delegate`, I still remember when I first started making iOS apps. There were so many delegates and I couldn't understand but now it is clear. You have delegate so that the controller can control the view. That's why you set `xxx.delegate = self`
    - Apple uses a lot of `delegates` and I don't know if this is good or bad
