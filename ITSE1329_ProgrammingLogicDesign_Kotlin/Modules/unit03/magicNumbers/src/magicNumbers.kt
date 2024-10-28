// Name: Crystal Hollis | Assignment Name: 04.2 Magic Dates | Date: 8/8/2023
// 1. Write a program that asks the user to enter a month (in numeric form), a day, and a two-digit year.
//Readability Criteria: The code is easy to read, with clear variable names, proper indentation, and
// comments where necessary.
//Programming Concepts Criteria: The program demonstrates an understanding of basic programming concepts such as
// variables, if statements, and functions.
package unit03
fun main() {
    // Input Validation Criteria: The program prompts the user to enter input values for month, day, and year, and
    // handles invalid input gracefully.
    //readLine reads inputs, toIntOrNull numbers as int or null for non-numbers
    println("Enter a valid month (1-12): ")
    val month = readLine()?.toIntOrNull()

    println("Enter a valid day: ")
    val day = readLine()?.toIntOrNull()

    println("Enter the two-digit year: ")
    val year = readLine()?.toIntOrNull()

    // Rules for valid dates i.e. leap year, certain month lengths
    fun validateDate(month: Int, day: Int, year: Int): Boolean {
       //Month 1-12, day 1-31, year can't be negative
        if (month < 1 || month > 12 || day < 1 || day > 31 || year < 0) {
            return false
        }
        //April, June, September, and November have 30 days
        if ((month == 4 || month == 6 || month == 9 || month == 11) && day == 31) {
            return false
        }
        //February have 28 days except 29 days during leap year
        if (month == 2) {
            if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
                return day <= 29
            } else {
                return day <= 28
            }
        }

        return true
    }
    // 2. The program should then determine whether the month times the day is equal to the year.
    // If so, it should display a message saying the date is magic. Otherwise, it should display a message
    // saying the date is not magic.
    if (month != null && day != null && year != null) {
        val isValidDate = validateDate(month, day, year)
        if (isValidDate) {
            //Correctness criteria: The program correctly determines if the month times the day is equal to the year.
            val isMagic = month * day == year
            if (isMagic) {
                println("The date is magic!")
            } else {
                println("The date is not magic.")
            }
        } else {
            println("Error: Invalid date.")
        }
    } else {
        println("Error: Please enter valid numeric values.")
    }
}
