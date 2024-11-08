# Kotlin bootcamp
I think I know most of the content but it might be good to study it again to have a stronger fundation.

## Basics
- `rem` is remainder
- `val` cannot change but `var` can
- `toInt` to convert to `Int` (some for others)
- `?` to support null value
- `!!` wraps optional (not recommended)
- `a?.b?.c?.d?.length ?: 0`, get length if a, b, c, d are not null and return 0 if any of them is
- `$variable` and `${variable.method()}`
- `if (fish in 1..100)`, range. Also, you can add `downTo` and `step`
- `when`, like switch but maybe better?
- `Array(5) { it * 2 }`
- `for (xx in xxs)`

## Functions
- `fun` for functions
- `Unit` is like `void`
- `if (condition) value else value`, `if` has a value
- `Random` for random values
- **`Everything has a value`**
- default value in functions, `swim(speed="slow")`
- `fun xxx(): Int = 5`, one line function use `=`
- You can put functions inside a function
- `filter` (like map, functional programming), `xxx.filter { true }`, it creates a new list
- `asSequence`, lazy (it won't compute unless necessary), `sequences`
- `lambdas`, function with no name, `val swim = { println("Swim") }` (in { })
- `{ num: Int -> num * 2 }`, `(Int) -> Int` (like Haskell)
- `::` to parse normal function to a `lambda`
- `update(xx) {xx -> xx }`, this is actually use another lambda function (callback)

## Classes
- `get() = xxxxx` after `val xx`
- `public` by default, there are also `internal` and `private`
- `internal` -> same module, `private` -> only inside the class (not even subclasses), `protected` -> like `private` but subclasses can use
- `class myFancyClass(var a: Int, var b: Int = 100)`, constructor
- `constructor(c: Int) : this()`
- `init { }`, you have multiple init and it will always run before the secondary constructor
- `open class a : b` for inheritance, `open` means non-final
- `abstract` and `interface`
-  **you can use `object` instead of `class` to make it singleton**
- `interface by xxx` calls everything in `xxx`, `interface delegation`, kinda like implementation of that interface and it will be called everytime
- `data class xxx` for data containers, it can print all properties easily. Basically, a class with many useful functions in it by default
- `val ( a, b, c ) = something` to take it out of the object, `decomposiiton`
- `object xxx { }` for singleton, `enum class xxx { }` for enums (you can have methods and properties in it), `sealed class xxx { }` (it can have subclasses only inside the same file) for safer type check? (because kotlin knows all subclasses)

## Beyond the basis
### Pairs
- `a to b` to make a pair and use `first` and `second` to take `a` and `b`, you can also chain pairs (`a to b to c to d`), you can also add `()` to group pairs
- `val (a, b) = p` to get values out of a pair
- `Pairs` is good for returning multiple values
- you also have `Triple` for 3 values
### Collections
- `List` has many useful functions
- `Map` -> `mapOf(a to b, c to d)` and get `b` by using `xxx[a]`
### Constant
- `const val`, compile time, only top level ot `object class`
- `companion object` for class level constants
### Extensions
- `func String.hasUpperCase()`, type.method, you don't even need to use `this`, just use lambda
- you can also add extension properties
### Generics
- I don't really use generics but it is similar
### Annotation
- you can write your own
- `annotation class xxx { }`
### Label break
- you can break top level loop (so don't need to break multiple times)
- `break@loop` and `loop@ for () {}`

## Functional Manipulation
### Higher order functions
- `with (xxx) { this.xxx }`, `this` is not necessary
- `fun xxx(xx: String, block: String.() -> Unit) {}`, you can just call `block()`
- `run`, `apply`, `let` (chaining)
- `lambda` is also an object and is created every time
- `inline fun xxx`, with inline, no objects will be created, good for simple function because it increase the size of the app
- `SAM, single abstract method`, interface with only one method
- `val runnable = object : Runnable { }`

There are much more and I have a lot more to learn but the basics should be fine.
