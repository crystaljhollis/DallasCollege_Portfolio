// Name: Crystal Hollis | Assignment Name: 05.1 Sum of Numbers | Date: 8/9/2023

// Assignment: Write a program that asks the user for a positive nonzero integer value.
// The program should use a loop to get the sum of all the integers from 1 up to the number entered.
// For example, if the user enters 50, the loop will find the sum of 1, 2, 3, 4, . . . 50.

//Readability Criteria: The code is easy to read and understand, with appropriate variable names and comments
//Functionality Criteria: The program works correctly and meets all requirements in the assignment prompt
//Efficiency Criteria: 	The program uses an appropriate algorithm and does not unnecessarily waste resources
//Input Validation Criteria: appropriate input validation to handle cases where the user enters invalid input

package unit05
fun main() {
    // Prompt the user for input
    println("Enter a positive nonzero Number:")
    val number = readLine()?.toIntOrNull() //Reads input, converts to integer or else null

    // Check if the input is valid
    if (number != null && number > 0) {  //check if input is not null and is greater than 0
        var x = 1
        var sum = 0

        // Calculate sum using a loop
        while (x <= number) { //loop executes for as long as x ≤ input number i.e. "50"
            sum += x // Add the value of x to the sum
            x++ // Increment the value of x by 1
        }

        // Print the final sum after the loop completes
        println("The sum of integers from 1 to $number is: $sum") //if input is "50", output should be 1275
    } else {
        println("Invalid input. Please enter a positive nonzero integer.") //error message for validation
        //if input is "-10" output should be the message above
    }
}
