// Name: Crystal Hollis | Assignment Name: 04.1 Roman Numerals | Date: 8/8/2023
package unit03
fun main() {
    // 1. The program should prompt the user to input a number within the inclusive range of 1 through 10.
    println("Enter a valid number between 1 and 10:")
    val userInput = readLine()     //readLine - Reads a line of input
    //  Input Validation criteria - The program should validate user input ensuring it is within range of 1 through 10.
    val number = userInput?.toIntOrNull()     // toIntOrNull - parses string as integer or null if not a number

    // 2. After accepting user input, the program should display the Roman numeral equivalent using only `if` and
    // `else` statements to make the determination. of the entered number. In the event that the entered number is
    // outside the range of 1 through 10, the program should display an error message.
    // Error Handling criteria - The program should handle errors gracefully, displaying an appropriate error message.
    if (number == null || number < 1 || number > 10) {  // '||' logical OR
        println("Error: Please enter a valid number between 1 and 10.")
    } else {
        // Roman Numeral Calculation Criteria - The program should correctly determine the Roman numeral equivalent
        // of the input number using only `if` and `else` statements.
        val romanNumeral = if (number == 1) "I"
        else if (number == 2) "II"
        else if (number == 3) "III"
        else if (number == 4) "IV"
        else if (number == 5) "V"
        else if (number == 6) "VI"
        else if (number == 7) "VII"
        else if (number == 8) "VIII"
        else if (number == 9) "IX"
        else "X"

        // Output Formatting Criteria - The program should display the Roman numeral equivalent of the input number
        // in a clear and readable format.
        println("The Roman numeral equivalent of $number is $romanNumeral.")
    }
}