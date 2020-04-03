import java.util.*

fun main(args : Array<String>) {
    dayOfWeek()
}

fun dayOfWeek() {
    println("What day is it today?")
    val day = when (Calendar.getInstance().get(Calendar.DAY_OF_WEEK)) {
        1 -> "Sunday"
        2 -> "Monday"
        3 -> "Tuesday"
        4 -> "Wednesday"
        5 -> "Thursday"
        6 -> "Friday"
        7 -> "Saturday"
        else -> "??"
    }

    println("Today is $day")
}

class AMS {

}
