
////////////////////////////////////////////////////////////////////////////////
// Stored Properties

struct FixedLengthRange {
    var start: Int
    let length: Int
}

var range = FixedLengthRange(start: 2, length: 5)

////////////////////////////////////////////////////////////////////////////////
// Lazy Stored Properties

// A lazy stored property is not calculated until the first time it is used.
// 
// When use lazy stored properties:
// - must always declare a lazy property as a variable
// -- 
// When to use lazy stored properties?
// - the initial value isn't known until after the instance is initialized.
// - the initial value requires complex or computationally expensive setup 
//   that should not be performed unless or until it is needed.

class DataImporter {
    init() {
        print("DataImporter is initialized.")
    }
    
    var fileName: String = ""
}

class DataManager {
    lazy var dataImporter = DataImporter()
}

let dataManager = DataManager()
print("At this time dataImporter isn't initialized.")

// When first access the property, it's initialized.
dataManager.dataImporter.fileName = "data.txt"

////////////////////////////////////////////////////////////////////////////////
// Computed Properties

struct Square {
    var length = 0.0
    
    var circumference: Double {
        get {
            return length * 4
        }
        
        set(newCircumference) {
            length = newCircumference / 4
        }
    }
}

////////////////////////////////////////////////////////////////////////////////
// Read-Only Computed Properties

struct Cuboid {
    var width = 0.0
    var height = 0.0
    var depth = 0.0
    
    var volume: Double {
        return width * height * depth
    }
}

////////////////////////////////////////////////////////////////////////////////
// Property Observers

class Walk {
    var steps: Int = 0 {
        willSet {
            print("Will set steps from \(steps) to \(newValue)")
        }
        
        didSet {
            print("Did set steps from \(oldValue) to \(steps)")
        }
    }
}

let walk = Walk()
walk.steps = 3

////////////////////////////////////////////////////////////////////////////////
// Type Properties

class SomeClass {
    static var storedTypeProperty = 1
    static var computedTypeProperty: Int {
        return 2
    }
    class var overridableComputedTypeProperty: Int {
        return 3
    }
}

SomeClass.storedTypeProperty // 1
