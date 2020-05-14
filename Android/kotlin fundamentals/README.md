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
- `Constraint Layout`
- `Ratio`, `Chain` (like space-around, space-between)
- Kotlin has an extension to use id directly but it is actually calling `_findCachedViewById` so data binding is still better I guess
- `baseline`, if a button is attached to another button's baseline, the button will follow that button for the margin top and bottom

## Chapter 3, Navigation
The moment, I have been waiting for...
- `Activity` can have multiple `Fragment`
- `Activity` is a stack and `Fragment`also has stack but in the same `Activity`
- all apps need a fixed starting point just like iOS
- `navigation.xml` is just like `storyboard`
- `NavHostFragment` handles navigation for fragments
- `Navigation.createNavigateOnClickListener(R.id.action_titleFragment_to_gameFragment)`, android is actually better because you need to type the string manually like iOS and everything has generated for you
- pop `inclusive` so it pops until that fragment
- `safe-args` to make sure bundle passed to another fragment is safe
- `intent`, use system camera, contacts and more. It can be `explicit` (specific) or `implicit` (what you want to do and system will choose the activity).
    - `intent-filter` is related to how the system knows if the app can handle what another app wants to do
    - Base on my understanding, it makes sense now why many file manager simply show an intent and you can view the image outside because this way, you don't need to implement an image gallery and video player. However, this is not possible in IOS. They are really different I guess. 
- `drawer`, drawer layout with the material library. I think I will use them for my app
- `pop animations` is when destination is poppoed off the stack

## Chapter 4, Activity & Fragment lifecycle
- `State` -> Initialized, Created, Started, Resumed and Destroyed
- `Log` has 6 levels, `Verbose` -> `Debug` -> `Info` -> `Warn` -> `Error` -> `Assert`
- `Application` class is a base class that contains global state for your entire app
    - put everything in global is not good sometimes
    - similar to `global` in javascript
- The `lifecycle`, I first started the app. I pressed home button and then come back
    - OnCreate called
    - onStart called
    - onResume called,
    - onPause called
    - onStop called,
    - onRestart called
    - onStart called
    - onResume called
- If you press `back` button, it will get destoyed after stop. However, if you press home and then, go to the task manager and kill it, nothing will be displayed (no destroyed). If you press task manager in app and kill it, it still get displayed
- If the activity is still visible, it is either started, resumed or paused (sometimes stop as well)
- `OnStart` can be called multiple times but `OnCreated` is once only when the activity is created
- `OnRestart` is replacing `OnCreate` if the activity is back again from the background
- `LifeCycleObserver`, the timer will control itself. This is really powerful
