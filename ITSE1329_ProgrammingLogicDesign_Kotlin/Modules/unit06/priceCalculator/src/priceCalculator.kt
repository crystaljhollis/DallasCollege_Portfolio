//Name: Crystal Hollis | Assignment Name: 06.2 Retail Price Calculator Problem | Date: 8/10/2023
//Assignment:
//Write a program that asks the user to enter an item’s wholesale cost and its markup percentage.
//It should then display the item’s retail price.
//For example:
//If an item’s wholesale cost is 5.00 and its markup percentage is 100 percent, then the item’s retail price is 10.00.
//If an item’s wholesale cost is 5.00 and its markup percentage is 50 percent, then the item’s retail price is 7.50.
//The program should have a function named calculateRetail that receives the wholesale cost and the markup percentage
// as arguments, and returns the retail price of the item.
//Criteria:
//Code executes without errors and produces correct output, Uses the calculateRetail function, Prompts the user for
// input and displays the result, and follows Kotlin best practices

package unit06
//Define function "calculateRetail" calculating retail price based on wholesale cost and markup percentage arguments
fun calculateRetail(wholesaleCost: Double, markupPercentage: Double): Double {
    //Calculate markup amount by multiplying wholesale cost with the markup percentage divided by 100
    val markupAmount = wholesaleCost * (markupPercentage / 100.0)
    //Calculate by adding the wholesaleCost with the markupAmount
    return wholesaleCost + markupAmount
}
//Define main function
fun main() {
    println("The Retail Price Calculator")

    // Prompt the user for wholesale cost
    print("Enter the wholesale cost: ") //'print()' displays prompt without moving to the next line after printing it
    val wholesaleCost = readLine()?.toDoubleOrNull() //read input and convert to Double-precision floating pt numbers

    // Prompt the user for markup percentage
    print("Enter the markup percentage: ")
    val markupPercentage = readLine()?.toDoubleOrNull()

    //Validation check
    if (wholesaleCost != null && markupPercentage != null) {
        //Call the calculateRetail function
        val retailPrice = calculateRetail(wholesaleCost, markupPercentage)
        //Display the calculated retail price by 2 decimal places
        println("The item's retail price is: \$%.2f".format(retailPrice))
    } else {
        println("Invalid input. Please enter valid numbers for wholesale cost and markup percentage.")
    }
}
