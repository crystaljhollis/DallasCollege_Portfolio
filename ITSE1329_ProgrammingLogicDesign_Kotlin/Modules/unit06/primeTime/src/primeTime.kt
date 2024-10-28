//Name: Crystal Hollis | Assignment Name: 06.1 Prime Time | Date: 8/10/2023
//Assignment:
//1. Write the following function "fun isNumberDivisible(number: Int, divisor: Int): Boolean" to determine if one
// number is divisible by another. It should return true when number is divisible by divisor (use modulo % operator)
//2. Next, write the main function "fun isPrime(number: Int): Boolean" to return true if number is prime, and
// false otherwise. Loop through the numbers from 1 to the number and find the number’s divisors.
//3. Check the following cases: "isPrime(6) // false" , "isPrime(13) // true" , "isPrime(8893) // true"

package unit06
import kotlin.math.sqrt
//checks if one number is divisible by another using modulo op %
fun isNumberDivisible(number: Int, divisor: Int): Boolean {
    return number % divisor == 0 //modulo op % check if remainder is 0
}

//determines if a number is prime by checking its divisors
fun isPrime(number: Int): Boolean {
    if (number <= 1) { //check for the condition of prime numbers being greater than 1
        return false
    }
//optimizing by checking divisors pp to the sqrt of the number, reducing the number of iterations for larger numbers
    val sqrtNumber = sqrt(number.toDouble()).toInt()  // Calculate the square root of the number

    for (divisor in 2..sqrtNumber) {  // Check divisors up to the square root
        if (isNumberDivisible(number, divisor)) {
            return false
        }
    }

    return true
}

// Demonstrates usage of 'isPrime()'
fun main() {
    println("This program is developed to check if a number is prime. Example:")
    println("isPrime(6): ${isPrime(6)}") // false
    println("isPrime(13): ${isPrime(13)}") // true
    println("isPrime(8893): ${isPrime(8893)}") // true
    println("Try it! Enter a number between 1 and 2,000,000,000 to check if it's prime:")

    val userInput = readLine()?.toIntOrNull()

    if (userInput != null) {
        println("isPrime($userInput): ${isPrime(userInput)}")
    } else {
        println("Invalid input. Please enter a valid number.")
    }
}