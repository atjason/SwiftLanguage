
////////////////////////////////////////////////////////////////////////////////
// Instance Methods

class Counter {
    var count = 0
    
    func increment() {
        count += 1
    }
    
    func incrementBy(amount: Int, numberOfTimes times: Int) {
        count += amount * times
    }

    func reset() {
        count = 0
    }
}

let counter = Counter()

counter.increment()
counter.count // 1

counter.incrementBy(2, numberOfTimes: 3)
counter.count // 7

counter.reset()
counter.count // 0


////////////////////////////////////////////////////////////////////////////////
// The self Property

// In practice, you don’t need to write self in your code very often.
// Mainly use self when a parameter name for an instance method has 
//   the same name as a property of that instance.

struct Point {
    var x = 0.0
    var y = 0.0
    
    func isToTheRightOfX(x: Double) -> Bool {
        return self.x > x
    }
}

let point = Point(x: 3.0, y: 4.0)
point.isToTheRightOfX(2) // true


////////////////////////////////////////////////////////////////////////////////
// Modifying Value Types from Within Instance Methods

// The properties of struct or enum can't be modified in instance methods by default.
// However, you can place the mutating keyword before the func to modify.

struct Square {
    var length = 0.0
    
    mutating func incrementLengthBy(length: Double) {
        self.length += length
    }
}

var smallSquare = Square(length: 1.1)

smallSquare.incrementLengthBy(2)
smallSquare.length // 3.1

enum Level {
    case Low, Medium, High
    
    mutating func next() {
        switch self {
        case Low:
            self = Medium
            
        case Medium:
            self = High
            
        case High:
            self = Low
        }
    }
}

var level = Level.High

level.next() // Low

////////////////////////////////////////////////////////////////////////////////
// Type Methods

// Add the static keyword before the method’s func keyword.
// Or add the class keyword to allow subclasses to override.

class SomeClass {
    static var typeProperty = 1
    
    static func aTypeMethod() {
        print("The type property is: \(typeProperty)")
    }
    
    // This method could be overrided.
    class func anotherTypeMethod() {
        print("The type property is: \(typeProperty)")
    }
}

SomeClass.aTypeMethod()
SomeClass.anotherTypeMethod()
