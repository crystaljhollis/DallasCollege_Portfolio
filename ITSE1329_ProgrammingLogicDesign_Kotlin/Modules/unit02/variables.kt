fun main(args: Array<String>) {
//1. Personal Age
 val myAge : Int = 32 // Int constant assigned value of my age
 println("My name is Crystal Hollis and I am $myAge years old.") // Should print "My name is Crystal Hollis and I am 32 years old."

//2. Average Age Calculation
 var averageAge: Double = myAge.toDouble()  //Double variable, holding value of age in the beginning, floating pt
 averageAge = (averageAge + 30) / 2.0  //floating pt, answer should be 31.0
 println("The average age calculation is $averageAge") //should print "The average age calculation is 31.0.

 //3. Modulo Operation
 val testNumber1: Int = 20
 val evenOdd1: Int = testNumber1 % 2  //modulo op; remainder should be '0' so its even.
 println("$testNumber1 is even because the remainder is $evenOdd1. Nice and even.") //should print "20 is even because the remainder is 0. Nice and even."
 val testNumber2: Int = 19
 val evenOdd2: Int = testNumber2 % 2  //remainder should be '1' so its odd.
 println("$testNumber2 is odd because the remainder is $evenOdd2. The Odd one out.") //should print "19 is odd because the remainder is 1. The odd one out."

 //4. Mathematical Operations
 var answer: Int = 0 //initialize the answer variable with '0'
 answer++ //increment operator, 0 + 1 should be 1.
 answer += 10 //addition assignment operator, 1 + 10
 answer *= 10 //multiplication assignment operator, multiplying answer by 10
 println("When using PEMDAS for (((0 + 1) + 10) 10), the final answer is $answer.") //should read "When using PEMDAS for (((0+1)+10) 10), the final answer is 110.

 //I observed that the mathematical operations work similarly like the Order of Operations. Each line is like inside of the parenthesis part of the order of operations, so it is initially solved then moves on to the next operation like one would moving to the next outer parenthesis.
}
