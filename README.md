# Mobile App Development training
I started with `Native iOS` development back in late 2016 and later switched to `React Native` in late 2017 and now, `Flutter` is my choice of developing mobile apps. 
I was an 'apple fanboy' but later, I switched to `Android` because my `iPhone 7` had severe `battery issue`. 
I have been using Android for quite a while but I don't know a lot about Android development. 
It might be the time to study native again I guess (both iOS and Android). 
I have used `React Native` and `Flutter` for some time but I still think native is better. 
However, they do fit my need better but it doesn't mean that I can skip native. 
`There is no shortcut in life` and I think it applies to mobile app development. 
Now, I am learning more about native development.
## Technology involved
- Swift, Objective-C, Java, Kotlin, Dart, JavaScript and TypeScript
- SwiftUI, Jetpack Compose, React, Node and JSX
- Maybe more?

# Contents
## [Native Android](https://github.com/HenryQuan/mobile_app_development_training/blob/master/Android/README.md)
Mainly focused on learning `Kotlin` and Android development. I had some experience with Android development but I don't think it is sufficient to make a good app yet. My goal is to make apps without much hassles (less searching more coding). 
## [Native iOS](https://github.com/HenryQuan/mobile_app_development_training/blob/master/iOS/README.md)
Mainly focused on learning `Swift`, `UIKit`, `SwiftUI` and more. I had more experience with iOS development and `WoWs Info` was originally written in `Swift 2` so I have a better understanding of how iOS works. I don't use iPhone but I do own one so I might make some iOS apps if I need to because certain things are better on iOS and it is the same for Android. 
## React Native
I have used `React Native` in a few apps with both `JavaScript` and `TypeScript`. It has many issues and that's why I am moving to `Flutter`. One issue is navigation and you are also losing lots of native features if your app is 100% react native. It is a great option to fix with native code and it is easier to bridge a module to it. 
## Flutter
Flutter is now my choice of mobile app development and it is not only mobile, you can also develop mac and web apps. If you want to, you can wrap web with electron to work on Windows, Linux and UWP. It is for all platforms but it is not perfect and the main issue is with the native side. However, it depends on your need. If you app is heavily content based and doesn't really use native features, it can be a great choice for early prototyping to be later replaced by native apps. 
## Extra
Other frameworks/technology that I tried or heard of before. However, this repo doesn't have any of them. 
### Xamarin
Xamarin is pretty good in my humble opinions and it is closer to native. You can share your C# code across iOS, Android and UWP and Mac and more. The only issue is how to bind native libraries. I think it shouldn't be that hard but I still don't know. `Xamarin Form` is also great to share UI across all devices. Ideally, it can be like React Native but it is actually true Native. 
### Ionic and other web-based
They are not native so I don't consider them (Flutter is a bit different I guess). The performance is not really good but the UI can be really fancy with the power of web. The major advantage of using these frameworks is that web developers can basically be a mobile dev in no time. 
### NativeScript
This is another interesting one. I never used it before but it says it can use all native API so it is more native than React Native but I wonder if that's the case. People say it is a bit slow and I tried the demo app. Yes, it lags so I don't know about this. It is probably closer to Xamarin than React Native. 
### Hardcore C++
Before everything above was a thing, I think bigger companies either have two teams working on iOS and Android or they can do `hardcore C++`. The idea is similar to Xamarin Traditional I guess. You still write native UI but C++ libraries are shared between two platforms to be cross platform. However, I never tried it before so I don't know how to do it.

### Kotlin Native
This is similar to low level C++. Still native UI but kotlin is used to write the core. Some codes are shared and there are also platform specific codes.

# What's the best choice?
It depends on your need. `Flutter` is the best for me now because I don't use native features that much. However, if I would make an app that I will use frequently, it will be a native Android app because I own an Android phone and vice versa.
- If you are a small team or just a solo like me, `React Native` and `Flutter` are great choices because they are low cost and you get two apps or more with one single codebase. After that, slowly convert it into native apps if possible
- For larger companies, native is the way to go because it is `the native`. Xamarin can also be a good choice if you want to share some code and UI. Hardcore C++ might be the traditional way to share code and it might be great as well 
- Alternatively, you can mix native with `React Native` or `Flutter` so you get the best of both.
