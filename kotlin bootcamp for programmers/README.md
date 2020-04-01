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
