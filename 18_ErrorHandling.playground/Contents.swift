
import Cocoa

////////////////////////////////////////////////////////////////////////////////
// Throw and Catch

enum PrinterError: ErrorType {
    case NoPaper
    case OutOfService
}

func doPrint() throws {
    throw PrinterError.NoPaper
}

do {
    try doPrint()
    
} catch PrinterError.NoPaper {
    print("No paper")
    
} catch {
    print("Printer has other error")
}

////////////////////////////////////////////////////////////////////////////////
// Assert

// When to use assertions?
// When a condition has the potential to be false, but must definitely be true.
// Suitable scenarios for an assertion check include:
//   Array's index is out of range.
//   Invalid parameter for a function.
//   An optional variant must have non-nil value.

// Assertions only work in debug mode.
//   In debug mode, if an assertion failed, App will stop at it.
//   In release mode, if an assertion failed, App will just terminate.

let age = -3
//assert(age >= 0, "Age can't be negative.") // This assert will fail
