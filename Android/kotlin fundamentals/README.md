# Android Kotlin Fundamentals
## Chapter 1, Basics
- `sp`, scales across devices
- `lateinit` makes sure that a variable will be init later
- `tools` namespace instead of `android` for dummy data and it is preview only, `android` namespace will be used in the app
- `vectorDrawables.useSupportLibrary = true` for smaller app size (vectors)

## Chapter 2, Layouts
- `dp` is different on all devices
- visibility, `gone` is not rendered, `invisible` is rendered
- data binding to prevent `findViewById` (it can be quite slow), data binding determines everything in compile time
~~~kotlin
dataBinding {
    enabled = true
}

wrap layout with
<layout></layout>

private lateinit var binding: ActivityMainBinding
binding = DataBindingUtil.setContentView(this, R.layout.activity_main)
~~~
- `invalidateAll()` to refresh UI but is it necessary?
- `android:text="@={myName.nickname}"`, you use `@={}` to bind data inside xml


