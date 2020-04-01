/**
 * If you start with 2 fish, and they breed twice,
 * producing 71 offspring the first time,
 * and 233 offspring the second time,
 * and then 13 fish are swallowed by a hungry moray eel,
 * how many fish do you have left?
 * How many aquariums do you need if you can put 30 fish per aquarium?
 */
fun aquariumCount(): Int {
    // It is integer so +1
    return (2 + 71 + 233 - 13) / 30 + 1;
}

fun nullRealated() {
    var rainbowColor: String? = "red"
    println(rainbowColor)
    rainbowColor = "blue"
    println(rainbowColor)
    rainbowColor = null

    val blueColour = null
    val redColour: String?

    val list: List<String?> = listOf(null, null)
    println(list.size)
    val nullList: List<String>? = null
    println(nullList?.size ?: 0)
}

fun main(args : Array<String>) {
    println(aquariumCount())
    nullRealated()
}