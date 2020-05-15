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
