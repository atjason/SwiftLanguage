
import Cocoa

////////////////////////////////////////////////////////////////////////////////
// Constants and Variables

let maxNumberOfLoginAttampts = 10
var currentLoginAttampts = 0

var welcomeString = "Hello"
var welcomeString2: String = "Hello"

////////////////////////////////////////////////////////////////////////////////
// Print
print("Hello World!")
print("Hello World ", terminator: "")
print("Again!")
print("1", "000", separator: "_")

////////////////////////////////////////////////////////////////////////////////
// Number

let minValue = Int.min
let maxValue = Int.max
//maxValue += 1 // This will cause runtime error.

let num1 = 2    // num1's type is Int. Prefer use Int but not others like UInt.
                // Int's size is same with platform's native word size.
let num2 = 3.14 // num2's type is Double. Prefer use Double but not Float.
                // Double's size is 64-bit.

var numericIteral: Int
numericIteral = 17
numericIteral = 0b10001 // Binary
numericIteral = 0o21    // Octal
numericIteral = 0x11    // Hexadecimal

var oneMillion = 1_000_000 // i.e., 1000000, easy to read
var justOverOneMillion = 1_000_000.000_000_1 // i.e., 1000000.0000001

let three = 3
let pi = 3.14
let threeAndPi = Double(three) + pi // Must explicitly convert Int to Double

////////////////////////////////////////////////////////////////////////////////
// Typealias

// When to use typealias
// Choose a better name of an existing type.
// Be able to change type in one place in future.

typealias Number = Int // e.g,. you can easily change it to Int8 later.
let maxNumber = Number.max

////////////////////////////////////////////////////////////////////////////////
// Tuple

let http404Error = (statusCode: 404, statusMessage: "Not Found")
let (statusCode, statusMessage) = http404Error
print("Result: \(statusCode) \(statusMessage)")
print("Result: \(http404Error.0) \(http404Error.1)")
print("Result: \(http404Error.statusCode) \(http404Error.statusMessage)")

////////////////////////////////////////////////////////////////////////////////
// Optional

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber) // Type: Int?

if convertedNumber != nil {
    print("The number is \(convertedNumber!).")
}

if let validNumber = convertedNumber {
    print("The number is \(validNumber).")
}

if let validNumber = convertedNumber, validNumber2 = convertedNumber
        where validNumber > 100 {
    print("The number is \(validNumber) and bigger than 100.")
}
