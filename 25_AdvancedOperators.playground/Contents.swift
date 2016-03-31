
////////////////////////////////////////////////////////////////////////////////
// Bitwise AND Operator

let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8  = 0b00111111
let middleFourBits = firstSixBits & lastSixBits  // 0b00111100


////////////////////////////////////////////////////////////////////////////////
// Bitwise OR Operator

let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedbits = someBits | moreBits  // 0b11111110

////////////////////////////////////////////////////////////////////////////////
// Bitwise XOR Operator

let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits  // 0b00010001


////////////////////////////////////////////////////////////////////////////////
// Bitwise Left and Right Shift Opeartors

let shiftBits: UInt8 = 4   // 0b00000100
shiftBits << 1             // 0b00001000
shiftBits >> 2             // 0b00000001


////////////////////////////////////////////////////////////////////////////////
// Overflow Operator

var unsignedOverflow1 = UInt8.max       // 0b11111111, 255
unsignedOverflow1 &+ 1                  // 0b00000000, 0

var unsignedOverflow2 = UInt8.min       // 0b00000000, 0
unsignedOverflow2 &- 1                  // 0b11111111, 255

var signedOverflow = Int8.min           // 0b10000000, -128
signedOverflow = signedOverflow &- 1    // 0b01111111, 127


////////////////////////////////////////////////////////////////////////////////
// Overloading the Existing Operators

struct Vector2D {
    var x = 0.0, y = 0.0
}

// Defined as a global function
func +(left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}

let leftVector = Vector2D(x: 3.0, y: 2.0)
let rightVector = Vector2D(x: 1.0, y: 2.0)
let combinedVector = leftVector + rightVector // (4.0, 4.0)

// Prefix and Postfix Operators
prefix func -(vector: Vector2D) -> Vector2D {
    return Vector2D(x: -vector.x, y: -vector.y)
}

let positive = Vector2D(x: 3.0, y: 2.0)
let negative = -positive // (-3.0, -2.0)

// Compound Assignment Operators
func +=(inout left: Vector2D, right: Vector2D) {
    left = left + right
}

// Equivalence Operators
func ==(left: Vector2D, right: Vector2D) -> Bool {
    return (left.x == right.x) && (left.y == right.y)
}

func !=(left: Vector2D, right: Vector2D) -> Bool {
    return !(left == right)
}


////////////////////////////////////////////////////////////////////////////////
// Custom Operators

// Declare Custom Operators
//   New operators are declared at a global level using the operator keyword,
//   and are marked with the prefix, infix or postfix modifiers:
prefix operator +++ {}

// Implement Custom Operators
prefix func +++(inout vector: Vector2D) {
    vector += vector
}

var toBeDoubled = Vector2D(x: 2.0, y: 4.0)
+++toBeDoubled // Now it's (4.0, 8.0)


////////////////////////////////////////////////////////////////////////////////
// Precedence and Associativity for Custom Infix Operators

// The possible values for associativity are left, right, and none.
//   Left-associative operators associate to the left
//     if written next to other left-associative operators.
//   Right-associative operators associate to the right
//     if written next to other right-associative operators.
//  Non-associative operators cannot be written next to other operators.

// Defaults: { associativity none precedence 100 }

infix operator +- { associativity left precedence 140 }

func +-(left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y - right.y)
}

let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector // (4.0, -2.0)
