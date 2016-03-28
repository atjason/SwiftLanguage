
////////////////////////////////////////////////////////////////////////////////
// Base Class and Simple Inheritance

class Vehicle {
    var speed = 0.0
    
    var description: String {
        return "travelling at \(speed) kilometers per hour"
    }
    
    func makeNoise() {
    
    }
}

class Bicycle: Vehicle {
    var hasBasket = false
}

////////////////////////////////////////////////////////////////////////////////
// Overriding Methods

class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

////////////////////////////////////////////////////////////////////////////////
// Overriding Properties

class Car: Vehicle {
    var gear = 1
    
    // Override Property Observers
    override var speed: Double {
        didSet {
            gear = Int(speed / 10.0) + 1
        }
    }
    
    // Override Property Getters and Setters
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

////////////////////////////////////////////////////////////////////////////////
// Prevent Overrides

class Calculator {
    final var pi: Double {
        return 3.14
    }
}

class ScientificCalculator: Calculator {
    // Can't override a final computed property
//    override var pi: Double {
//        return 3.1415926
//    }
}

////////////////////////////////////////////////////////////////////////////////
// Access Property as Super-Class or Sub-Class

class SuperClass {
    var num: Int {
        return 1
    }
}

class SubClass: SuperClass {
    override var num: Int {
        return 2
    }
}

let subClass = SubClass()
subClass.num // 2
// Note: Even access as SuperClass, still get SubClass's propery.
(subClass as SuperClass).num // 2
