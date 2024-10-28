// Name: Crystal Hollis | Assignment Name: 02.3 Advertising Conditional | Date: 7/27/2023
fun main() {

    //Int variable friendsCount test 1: 550 friends
    val friendsCount: Int = 550
println("Test 1: User with 550 friends:")

    //Condition test 1. Since 550, should be "Adopt a Dog Today!"
    if (friendsCount > 500) {
        println("Adopt a Dog Today!")
    } else {
        println("Buy Cat Food At 20% Off")
    }
println()
    //Int variable friendsCount test 2: 450 friends
    val friendsCount2: Int = 450
    println("Test 2: User with 450 friends:")

    //Condition test 2. Since 450, should be "Buy Cat Food At 20% Off"
    if (friendsCount2 > 500) {
        println("Adopt a Dog Today!")
    } else {
        println("Buy Cat Food At 20% Off")
    }
}