
// Extensions add new functionality to an existing class, structure,
//   enumeration, or protocol type. This includes the ability to extend types 
//   for which you do not have access to the original source code.

// Extensions in Swift can:
//   Add computed instance properties and computed type properties
//   Define instance methods and type methods
//   Provide new initializers
//   Define subscripts
//   Define and use new nested types
//   Make an existing type conform to a protocol


////////////////////////////////////////////////////////////////////////////////
// Computed Properties

// Can    add computed properties,
// Cann't add stored properties or property observers to existing properties.

extension Double {
    var km: Double {
        get {
            return self * 1_000.0
        }
    }
    
    var cm: Double {
        return self / 100.0
    }
}

let length1 = 2.3.km
print("\(length1) metters")
print("\(4.5.cm) metters")
print("\(0.5.km + 4.5.cm) metters")


////////////////////////////////////////////////////////////////////////////////
// Initializers

class Range {
    var start = 0
    var length = 0
}

extension Range {
    convenience init(start: Int, end: Int) {
        self.init()
        
        self.start = start
        self.length = end - start
    }
}


////////////////////////////////////////////////////////////////////////////////
// Methods

extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
    
    // Mutation Methods
    mutating func square() {
        self *= self
    }
}

2.repetitions({
    print("Hello World!")
})

var num = 2
num.square() // 4


////////////////////////////////////////////////////////////////////////////////
// Subscriptions

extension Int {
    subscript(index: Int) -> Int {
        var num = self
        
        for _ in 0..<index {
            num /= 10
        }
        
        return num % 10
    }
}

12345[0] // 5
12345[4] // 1
12345[5] // 0


////////////////////////////////////////////////////////////////////////////////
// Nested Types

extension Int {
    enum Kind {
        case Negative, Zero, Positive
    }
    
    var kind: Kind {
        switch self {
        case let num where num < 0:
            
            // Note: as the returned type must be Kind,
            //       Kind.Negative can be written in shorthand form of .Negative
            return .Negative
            
        case 0:
            return .Zero
        
        default:
            return .Positive
        }
    }
}

2.kind // Positive
