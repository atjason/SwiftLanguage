
import Cocoa

////////////////////////////////////////////////////////////////////////////////
// Function Parameters and Return Values

func sayHelloWorld() -> String {
    return "Hello World"
}

print(sayHelloWorld())

func sayHello(name: String) -> String {
    return "Hello, " + name
}

print(sayHello("Tom"))

func sayGoodbay(name: String) {
    print("Goodbye, " + name)
}

sayGoodbay("Tom")

////////////////////////////////////////////////////////////////////////////////
// Functions with Optional Multiple Return Values

func minMax(numbers: [Int]) -> (min: Int, max: Int)? {
    
    guard !numbers.isEmpty else {
        return nil
    }
    
    var minNumber = numbers[0]
    var maxNumber = numbers[0]
    
    for number in numbers[1..<numbers.count] {
        if number < minNumber {
            minNumber = number
            
        } else if number > maxNumber {
            maxNumber = number
        }
    }
    
    return (minNumber, maxNumber)
}

if let bounds = minMax([3, 1, 2]) {
    print("min: \(bounds.min)")
    print("max: \(bounds.max)")
}

////////////////////////////////////////////////////////////////////////////////
// Specifying External Parameter Names

// By default, the first parameter omits its external name.
// The use of external parameter names can allow a function to be called 
//   in an expressive, sentence-like manner.

func sayHello(to person: String, and anotherPerson: String) -> String {
    return "Hello, \(person) and \(anotherPerson)."
}

print(sayHello(to: "Tom", and: "Jack"))

////////////////////////////////////////////////////////////////////////////////
// Omitting External Parameter Names

func sayHello2(person: String, _ anotherPerson: String) -> String {
    return "Hello, \(person) and \(anotherPerson)."
}

print(sayHello2("Tom", "Jack"))

////////////////////////////////////////////////////////////////////////////////
// Default Parameter Values

// Place parameters with default values at the end of the parameter list.
// This ensures that all calls to the function use the same order 
//   for their nondefault arguments.

func sayHello3(person: String = "World") -> String {
    return "Hello, " + person
}

print(sayHello3())
print(sayHello3("Tom"))

////////////////////////////////////////////////////////////////////////////////
// Variadic Parameters

// A variadic parameter accepts zero or more values of a specified type.
// And it will be treated as an array of the appropriate type in the function.

func calcAverage(numbers: Double...) -> Double? {
    // Note: the variadic parameter can have no value.
    guard numbers.count > 0 else {
        return nil
    }
    
    var sum = 0.0
    
    for number in numbers {
        sum += number
    }
    
    return sum / Double(numbers.count)
}

if let average = calcAverage(3, 1, 2) {
    print(average)
}

// A function could have at most one variadic parameters.
// The parameters in following fuction are incorrect.
//func test(a: Int..., b: Double...) {
//    
//}

////////////////////////////////////////////////////////////////////////////////
// In-Out Parameters

func swapTwoInts(inout num1: Int, inout _ num2: Int) {
    (num1, num2) = (num2, num1)
}

var num1 = 1
var num2 = 2

swapTwoInts(&num1, &num2)

print("num1: \(num1), num2: \(num2)")

////////////////////////////////////////////////////////////////////////////////
// Function Types

func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(a: Int, b: Int) -> Int {
    return a * b
}

func printMathResult(mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(2, 3))")

printMathResult(multiplyTwoInts, 2, 3)

////////////////////////////////////////////////////////////////////////////////
// Function Types as Return Types

func stepForward(num: Int) -> Int {
    return num + 1
}

func stepBackward(num: Int) -> Int {
    return num - 1
}

func chooseStepFunction(isForward: Bool) -> ((Int) -> Int) {
    return isForward ? stepForward : stepBackward
}

func moveToZero(num: Int) -> Int {
    if num == 0 {
        return 0
    }
    
    let move = chooseStepFunction(num < 0)
    return move(num)
}

var count = 2
print(count)

while count != 0 {
    count = moveToZero(count)
    print(count)
}

////////////////////////////////////////////////////////////////////////////////
// Nested Functions

func printInfo(name: String, age: Int) {
    
    func printName(name: String) {
        print("Name: \(name)")
    }
    
    func printAge() {
        // Note: The function inside can access the member in function outside.
        print("Age: \(age)")
    }
    
    printName(name)
    printAge()
}

printInfo("Tom", age: 2)
