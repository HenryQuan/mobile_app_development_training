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
- `Android` tries save your app current state/data in a bundle but it doesn't work for custom ones
    - `onSaveInstanceState` can save some small amount of data (100 KB), don't save everything in it or the app might crash. Always call `super` because it saves some data for you
    - It uses key-value pair like a dictionary
    - It is only saved like once? (so it doesn't persist)
- When I rotate the screen, it actually destoryed the activity and later recreated. What??
- `Configuration Change`, when the configuration changed, you might want to show a completely new interface. Therefore, Android destroys old activities and recreates them. This is really powerful sometimes. Android is sure complicated. 

## Chapter 5, Application Architecture (UI Layer)
- There are many great architectures. For this chapter, it is mainly controller - viewmodel - data
- `ViewModels`, it can survive with configuration changes and no restrictions on size (not too much of course)
- `UI Controller` only controls the UI and user events and `it doesn't hold any data`. `ViewModels` are holding data for UI and `it makes decisions for what to do` 
- `ViewModel` doesn't know about activities, fragments or views so no reference to any of them
- `androidTest` focuses on Android and `test` can run without android (more like code test)
- `LiveData` is an observable data holder and it is also lifecyle aware. Fragments are observing LiveData and update UI according to it
    - It only updates UI when UI is `on-screen`
    - It will update UI once the UI is visible again
    - It cleans up connections automatically
    - It also observes the `LifeCycle` of the activity or any other things
- Make fields `private` so that you can have better controls over them. `private var _xxx` and make a public getter. This is what I do in Flutter if I am not too lazy. I don't make them private sometimes because it is not necessary? but I do use getters to do some calculations or conversions. It is great to do it for everything
- `DateUtils.formatElapsedTime` to format time in milliseconds to a readble string
- `Factory` to create `ViewModel` with parametres (custom view model)
- `DataBinding` to remove more codes, you can put them in the xml inside `data` tag and use `@{() -> xxx}` to call methods
    - You can even remove observe functions so it works with observable objects and use `@{}` to set the value
- You can put a formatting string in `strings.xml` like `\"%s\"` and `Score: %d` so you can put value in and be formatted nicely
~~~
val currentTimeString = Transformations.map(currentTime) { time ->
    DateUtils.formatElapsedTime(time)
}
~~~
- You can use transformation to format the time but I think I just skipped it because my time is a string. This is like writing some getters in Flutter because it is basically transforming some data fields
- `vibrate` can be useful if used properly I guess

## Chapter 6, Application Architecture (Persistence)
Database with `room`, I learnt about database in one of my courses but I haven't really used it in any apps yet so it might be a great chance to use it
- `Entity` defines a table, `Query` requests data (table) and `Room` handles a lot for us
- `DAO`, `SQLite` and Entity classes
- `PrimaryKey` and `ColumnInfo`
- `DAO` supports basic operations, insert, add and delete. You can add your own as well
- It maps everything correctly and we can just use kotlin to control the databases
- Use `<merge>` to prevent duplication. For example, if you want to have two button under a linear layout, you don't need to wrap them in a linear layout but instead, you can just use `<merge>`. It is kinda similar to `<>` in react native
- `suspend` is kinda like `async` and it is not blocking the thread it is running on (usually UI thread)
    - You need to run it inside a context scope
