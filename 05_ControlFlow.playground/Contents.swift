
import Cocoa

////////////////////////////////////////////////////////////////////////////////
// For-In Loops

var sum = 0
for index in 1...5 {
    sum += index
}
sum // 15

var exp = 1
for _ in 0..<3 {
    exp *= 2
}
exp // 2^3 = 8

////////////////////////////////////////////////////////////////////////////////
// While and Repeat-While Loops

// 1+2+...n < 100, what's the max n?

var sum1 = 0
var num1 = 1
while sum1 < 100 {
    sum1 += num1
    num1 += 1
}
num1 // 15

var sum2 = 0
var num2 = 1
repeat {
    sum2 += num2
    num2 += 1
} while sum2 < 100
num2 // 15

////////////////////////////////////////////////////////////////////////////////
// If

let testNum = 0

if testNum < 0 {
    // Negative
    
} else if testNum == 0 {
    // Zero
    
} else {
    // Positive
}

////////////////////////////////////////////////////////////////////////////////
// Switch

let testNum2 = 0

switch testNum2 {
case let x where x < 0:
    print("Negavie")
    
case 0:
    print("Zero")
    
case 1...9:
    print("[1, 9]")
    
default:
    print("Other positive numbers.")
}

let somePoint = (1, 1)

switch somePoint {
case (_, 0):
    print("x-axis")

case (-2...2, -2...2):
    print("In rectangel of {(-2, 2), (2, -2)}")

case let (x, y) where x == y:
    print("(\(x),\(y)) is on the line of x == y.")
    
default:
    print("Other cases")
}

////////////////////////////////////////////////////////////////////////////////
// Continue

// Deal with every even number in an Array
let numbers = [3, 4, 2, 1]

for number in numbers {
    if (number % 2) != 0 {
        continue
    }
    
    print("\(number) ", terminator: "")
}
print()

////////////////////////////////////////////////////////////////////////////////
// Break

// Find first vowel in an Array
let characters: [Character] = ["b", "c", "a", "e"]

loopCharacters: for char in characters {
    switch char {
    case "a", "e", "i", "o", "u":
        print(char)
        break loopCharacters
        
    default:
        break
    }
}

////////////////////////////////////////////////////////////////////////////////
// guard

// When to use gurad?
// When a condition must be true.
// Note: a guard statement always has an else clause.

func check(student: [String: String]) {
    guard let name = student["name"] else {
        return
    }
    
    print("Name: \(name)")
    
    guard let location = student["location"] else {
        return
    }
    
    print("Location: \(location)")
}

var student = ["name": "Tom"]
check(student)

student["location"] = "Earth"
check(student)

////////////////////////////////////////////////////////////////////////////////
// Checking API Availability

// * is required and specifies that on any other platform,
// the body of the if executes on the minimum deployment target specified by your target.
if #available(iOS 9, OSX 10.10, *) {
    // do something
}

// Note: @available only limit the just following function, class, etc.
// But not the other code after the following function, class, etc.
@available(iOS 9, OSX 10.10, *)
func runWithNewFeature() {
    // do something
}


