
////////////////////////////////////////////////////////////////////////////////
// Setting Initial Values for Stored Properties

class ClassA {
    // Default Property Values
    var num = 0.0
}

class ClassB {
    var num: Double
    
    // Initializers
    init() {
        num = 0.0
    }
}


////////////////////////////////////////////////////////////////////////////////
// Customizing Initialization

class ClassC {
    var num: Double
    
    init(num: Double) {
        self.num = num
    }
}


////////////////////////////////////////////////////////////////////////////////
// Local and External Parameter Names

struct Color {
    var red: Double
    var green: Double
    var blue: Double
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
}

var redColor = Color(red: 1, green: 0, blue: 0)


////////////////////////////////////////////////////////////////////////////////
// Optional Proptery Values

class ClassD {
    var num: Double?
}

let classD = ClassD()
classD.num // nil


////////////////////////////////////////////////////////////////////////////////
// Assigning Constant Properties Value During Initialization

class ClassE {
    let pi: Double
    
    init() {
        pi = 3.14
    }
}


////////////////////////////////////////////////////////////////////////////////
// Default Initializers

// Swift provides a default initializer for any structure or class 
// that provides default values for all of its properties and 
// does not provide at least one initializer itself.

class ClassF {
    let pi = 3.14
}

let classF = ClassF()
classF.pi // 3.14


////////////////////////////////////////////////////////////////////////////////
// Class Inheritance and Initialization

// Designated initializers are the primary initializers for a class.
//
// Convenience initializers are secondary, supporting initializers for a class.
// Create convenience initializers whenever a shortcut to a common 
//   initialization pattern make initialization of the class clearer in intent.

// Designated initializers must always delegate up.
// 1. Initialize storaged properties.
// 2. Call supperclass's designated initializers.
// 3. Customize storaged properties in same class.

// Convenience initializers must always delegate across.
// 1. Call desiganted initializers in same class.
// 2. Customize storaged properties in same class.

class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheels"
    }
}

class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

class Food {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[Unamed]")
    }
}

class RecipeIngredient: Food {
    var quantity: Int
    
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    convenience override init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

class ShoppingListItem: RecipeIngredient {
    var purchased = false
    
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}

let breakfastList = [
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Egg", quantity: 3)
]

breakfastList[0].purchased = true

for item in breakfastList {
    print(item.description)
}


////////////////////////////////////////////////////////////////////////////////
// Failable Initializers

enum TemperatureUnit: Character {
    case Kelvin = "K"
    case Celsius = "C"
    case Farenheint = "F"
    
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
            
        case "C":
            self = .Celsius
            
        case "F":
            self = .Farenheint
            
        default:
            return nil
        }
    }
}

let temparatureUnit1 = TemperatureUnit(symbol: "a") // nil
let temparatureUnit2 = TemperatureUnit(rawValue: "a") // nil


////////////////////////////////////////////////////////////////////////////////
// Overriding a Failable Initializer

class Document {
    var name: String?
    
    init() {}
    
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        
        self.name = name
    }
}

class AutomaticallySavedDocument: Document {
    private let unamedFileName = "Unamed"
    
    override init() {
        super.init()
        
        self.name = unamedFileName
    }
    
    override init(name: String) {
        super.init()
        
        self.name = name.isEmpty ? unamedFileName : name
    }
}


////////////////////////////////////////////////////////////////////////////////
// Required Initializers

class SomeClass {
    required init() {
        
    }
}

class SomeSubClass: SomeClass {
    required init() {
        
    }
}
