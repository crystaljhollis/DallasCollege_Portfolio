//Name: Crystal Hollis | Assignment Name: 05.3 Random Number Guessing Game | Date: 8/9/2023
//Assignment:
//Write a program that generates a random number and it ask the user to guess what the number is
// If the user’s guess is higher, should display “Too high, try again”
// If the user’s guess is lower, should display “Too low, try again”
// Use a loop that repeats until the user correctly guesses the random number

//Criteria:
//Correctly generate random number, correctly prompts user for a guess, correctly handles guesses too high or
//too low, outputs correct number of guesses taken to guess the number, and code is organized and easy to read

package unit05
import kotlin.random.Random

fun main() {
    val randomNumber = Random.nextInt(1, 101) // Generates a random number between 1 and 100
    var numberOfGuesses = 0

    println("~~The Number Guessing Game~~")
    println("Try to guess a number between 1 and 100 to win a prize.")

    while (true) { //'while' loop to repeatedly prompt the user until they guess correctly
        print("Enter your guess: ")
        val guess = readLine()?.toIntOrNull() //reads inputs and converts to integer

        if (guess == null) {
            println("Error. Please enter a number between 1 and 100.") //Error message for validation
            continue
        }

        numberOfGuesses++ //this helps keep track of how many guesses the user made until they guessed correctly

        when {
            guess > randomNumber -> println("Too high, try again.")
            guess < randomNumber -> println("Too low, try again.")
            else -> {
                println("Congratulations! You've guessed the number $randomNumber.")
                println("It took you $numberOfGuesses guesses.")
                println("Here is your prize: ")
                println("        .") //ASCII art of a star
                println("       ,O,")
                println("      ,OOO,")
                println("'oooooOOOOOooooo'")
                println("  `OOOOOOOOOOO`")
                println("    `OOOOOOO`")
                println("    OOOO'OOOO")
                println("   OOO'   'OOO")
                println("  O'         'O")
                break
            }
        }
    }
}
