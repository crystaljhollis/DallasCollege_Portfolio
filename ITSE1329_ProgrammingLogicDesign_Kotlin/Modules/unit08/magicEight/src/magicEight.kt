//Name: Crystal Hollis | Assignment Name: 08.1 Magic 8 Ball | Date: 8/11/2023
//Assignment:
//Write a program that simulates a Magic 8 Ball, which is a fortune-telling toy that displays a random response to a
// yes or no question. You should create an array containing 10 responses, such as "I don’t think so," "Yes,of course!,"
// "I’m not sure," and so forth. The program should prompt the user to ask a question and then display one of the
// responses, randomly selected from the array object. The program should repeat until the user is ready to quit.
//Make sure that the responses array is defined within the program, and not read from an external file.

package unit08
import kotlin.random.Random // Importing Random class to generate random numbers

fun main() {
    val responses = arrayOf( // Array initialization and declaration
        "Yes, of course!", "Without a doubt, yes.", "You can count on it.",
        "For sure!", "Ask me later.", "I’m not sure.",
        "I can’t tell you right now.", "I’ll tell you after my nap.",
        "No way!", "I don’t think so."
    )

    val random = Random(System.currentTimeMillis()) // Create a Random object with a seed based on current time

    var playAgain = true // Initialize the playAgain variable to true
    println("~~Welcome to the Magic 8 Ball Simulation!~~")
    while (playAgain) { // Repeat the loop as long as playAgain is true
        println("Ask a yes or no question:") // Prompt the user to ask a question
        val question = readLine() // Read the user's input (question)

        val randomIndex = random.nextInt(responses.size) // Gives the size of the 'responses' array
        println("Magic 8 Ball says: ${responses[randomIndex]}") // Prints the random response
        println("Do you want to ask another question? (yes/no):") // Prompts to continue until user is ready to quit
        val anotherQuestion = readLine()?.toLowerCase() // Reads yes/no input and convert to lowercase

        playAgain = (anotherQuestion == "yes") // Set playAgain to true if the user entered "yes", otherwise false
    }

    println("Goodbye!") // Ending loop
}
