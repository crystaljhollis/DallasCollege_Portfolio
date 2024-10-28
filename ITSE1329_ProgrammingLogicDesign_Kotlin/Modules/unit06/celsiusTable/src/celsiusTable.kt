//Name: Crystal Hollis | Assignment Name: 06.3 Celsius Temperature Table | Date: 8/10/23
//Assignment:
//Write a function named celsius that accepts a Fahrenheit temperature as an argument.
// The function should return the temperature, converted to Celsius.
// Demonstrate the function by calling it in a loop that displays a table of the Fahrenheit temperatures 0 through 20
// and their Celsius equivalents.
//Note: F to C conversion: C = 5/9 *(F−32)
//Criteria:
//Correct implementation of the `celsius` function, Loop iterates over values 0 to 20 (inclusive), Table displays
// Fahrenheit and Celsius temperatures, Table formatting (clear, easy to read)
package unit06

// celsius Function to convert Fahrenheit to Celsius
fun celsius(fahrenheit: Double): Double { //Fahrenheit parameter Double data type, calculating w/conversion formula
    return (5.0 / 9.0) * (fahrenheit - 32.0)
}
//Loop displaying table of Fah. temps 0-20 and celsius equivalents
fun main() {
    // Print the table header
    println("\u001B[1mFahrenheit to Celsius Conversion Table\u001B[0m") //"Fahrenheit to Celsius Conversion Table", bold
    println("\u001B[34;1mFahrenheit (°F)\t\u001B[0m\u001B[35;1mCelsius (°C)\u001B[0m") //Fah. in Blue, Cels. in purple
    println("-----------------------------")

    // Loop from 0 to 20 (inclusive)
    for (fahrenheit in 0..20) { //'for' loop, inclusive range 0-20
        // Call the celsius function to convert Fahrenheit to Celsius
        val celsiusTemp = celsius(fahrenheit.toDouble())

        // Print the Fahrenheit and corresponding Celsius temperature, used ANSI escape codes for color formatting
        // Using "%.2f" to format the Celsius temperature with 2 decimal places
        println("\u001B[34m$fahrenheit\t\t\t\t\u001B[0m\u001B[35m${"%.2f".format(celsiusTemp)}\u001B[0m")
    }
}
