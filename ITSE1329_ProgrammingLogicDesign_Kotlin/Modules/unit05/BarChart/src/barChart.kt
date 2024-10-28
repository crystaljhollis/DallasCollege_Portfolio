//Name: Crystal Hollis | Assignment Name: 05.2 Bar Chart | Date: 8/9/2023

//Assignment: Bar Chart
//Write a program that asks the user to enter today’s sales for five stores.
//The program should display a bar chart comparing each store’s sales.
//Create each bar in the bar chart by displaying a row of asterisks.
//Each asterisk should represent $100 of sales.

//Criteria:
//Functionality: correctly asks user to enter today's sales for five stores and displays a bar chart comparing
//each store's sales. Should not use scanner class or arrays
//Code Quality: Well-organized, easy to read, variable names descriptive, comments explain code necessary
//User Interface: clear and easy to understand, prompts user for input, bar chart well-formatted and easy to read
//Creativity: creatively designed and visually appealing, goes beyond basic requirements, engaging experience

package unit05
fun main() {
    //The following program uses Unicode characters and ANSI escape codes for colors. These features might not
    //display if you're using older IDEs or basic text editors that might not render these correctly.

    // Initialize a list to store sales for each store
    val salesList = mutableListOf<Int>() //makes the list mutable so users can add, remove, modify elements

    // Get sales input for each store and add it to the list
    for (store in 1..5) { //loop construct iterating through range 1-5, for stores 1-5
        print("Enter today's sales for store $store: ")
        val sales = readLine()?.toIntOrNull() //reads user input, converts to integer
        if (sales != null && sales >= 0) {
            salesList.add(sales) //validates input, ensuring only non-null and non-negative values are added
        } else {
            println("Invalid input. Please enter a non-negative integer.")
            return
        }
    }

    // Display the sales bar chart with styled text
    println("          【𝗦𝗮𝗹𝗲𝘀 𝗕𝗮𝗿 𝗖𝗵𝗮𝗿𝘁】")  //The spaces allow it to be positioned where asterisks start.
    for ((place, sales) in salesList.withIndex()) { //loop that iterates through the salesList
        //gives both index and sales value so it can generate the bar chart and determine ranking of stores
        val storeName = "Store ${place + 1}"
        val asterisks = "*".repeat(sales / 100)
        val storeColor = when (place) {
            //The following uses ANSI escape codes for color and bold style of text
            //Use of bold and color should help the User visually distinguish between stores
            0 -> "\u001B[31;1m" // Red for Store 1
            1 -> "\u001B[35;1m" // Purple for Store 2
            2 -> "\u001B[34;1m" // Blue for Store 3
            3 -> "\u001B[32;1m" // Green for Store 4
            4 -> "\u001B[33;1m" // Gold for Store 5
            else -> "\u001B[0m" // Reset color for others
        }
        val asterisksColor = when (place) {
            0 -> "\u001B[38;5;205m" // Pink asterisks for store 1
            1 -> "\u001B[38;5;183m" // Lavender asterisks for store 2
            2 -> "\u001B[38;5;117m" // Light Blue asterisks for store 3
            3 -> "\u001B[38;5;156m" // Light Green asterisks for store 4
            4 -> "\u001B[38;5;220m" // Yellow asterisks for store 5
            else -> "\u001B[0m" // Reset color for others
        }
        val resetCode = "\u001B[0m" // Reset color

        println("$storeColor$storeName ➱ $asterisksColor$asterisks 【\$$sales】$resetCode")
    //should appear as "Store number ➱ however many asterisks 【sales input value】"
    }

    //This section determines the ranking based on original input order, making it an engaging experience
    val ranking = salesList.indices.sortedByDescending { salesList[it] }
    //store indices "ranking" sorted in descending order
    println("\nStore ${ranking[0] + 1} is 【\u001B[33m1st place\u001B[0m】")
    //should display store with most sales. 1st place should be gold color.
    if (ranking.size > 1) {
        println("Store ${ranking[1] + 1} is 【\u001B[37m2nd place\u001B[0m】")
    //should display store with second most sales. 2nd place should be silver color.
    }
    if (ranking.size > 2) {
        println("Store ${ranking[2] + 1} is 【\u001B[38;5;166m3rd place\u001B[0m】")
    //should display store with third most sales. 3rd place should be orange (bronze-like) color.
    }
//This section should help the user understand what the asterisks represent
    println("\n[Legend: Each * represents \$100 in sales]")
}
