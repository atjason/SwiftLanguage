
import Foundation

////////////////////////////////////////////////////////////////////////////////
// Property Requirements

// The protocol specifies 
//   the required property name and type
//   whether each property must be gettable or gettable and settable.
// The protocol doesn’t specify 
//   whether the property should be a stored property or a computed property.

// If a protocol requires a property to be gettable and settable, 
//   that property requirement cannot be fulfilled by a constant stored property 
//   or a read-only computed property.
// If the protocol only requires a property to be gettable, 
//   the requirement can be satisfied by any kind of property.

protocol DemoProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
    
    static var someTypeProperty: Int { get }
}


////////////////////////////////////////////////////////////////////////////////
// Method Requirements

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) % m)
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
print("And another one: \(generator.random())")


////////////////////////////////////////////////////////////////////////////////
// Mutating Method Requirements

protocol Togglable {
    mutating func toggle()
}

enum OnOffState: Togglable {
    case On, Off
    
    mutating func toggle() {
        switch self {
        case On:
            self = Off
        case Off:
            self = On
        }
    }
}

var state = OnOffState.On
state.toggle() // Off


////////////////////////////////////////////////////////////////////////////////
// Initializer Requirements

protocol SomeProtocol {
    init()
}

class SomeSuperClass {
    init() {}
}

class SomeSubClass: SomeSuperClass, SomeProtocol {
    // "required" from SomeProtocol conformance;
    // "override" from SomeSuperClass.
    required override init() {}
}


////////////////////////////////////////////////////////////////////////////////
// Protocols as Types

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())

for _ in 0..<5 {
    print("Random dice roll is \(dice.roll())")
}


////////////////////////////////////////////////////////////////////////////////
// Delegation

protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate {
    func gameDidStart(game: DiceGame)
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(game: DiceGame)
}

class SnackerAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    var delegate: DiceGameDelegate?
    
    init() {
        board = [Int](count: finalSquare + 1, repeatedValue: 0)
        
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    
    func play() {
        square = 0
        
        delegate?.gameDidStart(self)
        
        gameLoop: while square != finalSquare {
            
            let diceRoll = dice.roll()
            let newSquare = square + diceRoll
            
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            
            switch newSquare {
            case finalSquare:
                break gameLoop
                
            case let theSquare where theSquare > finalSquare:
                continue gameLoop
                
            default:
                square = newSquare + board[square]
            }
        }
        
        delegate?.gameDidEnd(self)
    }
}

class SnackerAndLaddersTracker: DiceGameDelegate {
    var countOfTurns = 0
    
    func gameDidStart(game: DiceGame) {
        countOfTurns = 0
        
        if game is SnackerAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        
        print("The is using a \(game.dice.sides)-sided dice")
    }
    
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        countOfTurns += 1
        print("Play with dice roll: \(diceRoll)")
    }
    
    func gameDidEnd(game: DiceGame) {
        print("Dice game ends. Last for \(countOfTurns) turns")
    }
}

let snackerAndLadders = SnackerAndLadders()
snackerAndLadders.delegate = SnackerAndLaddersTracker()

print()
snackerAndLadders.play()


////////////////////////////////////////////////////////////////////////////////
// Extend an existing type to conform to a protocol

protocol TextualRepresentable {
    var textualDescription: String { get }
}

extension Dice: TextualRepresentable {
    var textualDescription: String {
        return "A \(self.sides)-sided dice"
    }
}

let anotheDice = Dice(sides: 12, generator: LinearCongruentialGenerator())

print()
print(anotheDice.textualDescription)


////////////////////////////////////////////////////////////////////////////////
// Class-Only Protocols

// Limit protocol adoption to class types (and not structures or enumerations)
//   by adding the class keyword to a protocol’s inheritance list.

protocol SomeClassOnlyProtocol: class { }


////////////////////////////////////////////////////////////////////////////////
// Protocol Combosition

// Require a type to conform to multiple protocols at once.

protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

class Person: Named, Aged {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

// Protocol compositions have the form protocol<SomeProtocol, AnotherProtocol>
func wishHappyBirthday(celebrator: protocol<Named, Aged>) {
    print("Happy birthday \(celebrator.name), you're \(celebrator.age)!")
}

print()

let person = Person(name: "Tom", age: 30)
wishHappyBirthday(person)


////////////////////////////////////////////////////////////////////////////////
// Checking for Protocol Conformance

// is, as?, as!

let objects: [AnyObject] = [
    Person(name: "Tom", age: 30),
    SnackerAndLadders()
]

print()

for object in objects {
    if let person = object as? Named {
        print("Name: \(person.name)")
        
    } else if object is DiceGame {
        print("This is a DiceGame")
    }
}


////////////////////////////////////////////////////////////////////////////////
// Optional Protocol Requirements

// Optional protocol requirements can only be specified 
//   if your protocol is marked with the @objc attribute.
@objc protocol MoveProtocol {
    optional func move(count: Int) -> Int
}

// @objc protocols can be adopted only by classes that inherit from 
//   Objective-C classes or other @objc classes.
//   They can’t be adopted by structures or enumerations.
class MoveToZero: NSObject, MoveProtocol {
    
    func move(count: Int) -> Int {
        if count < 0 {
            return count + 1
            
        } else if count > 0 {
            return count - 1
        }
        
        return 0
    }
}

class Counter {
    var count: Int
    var moveDelegate: MoveProtocol?
    
    init(count: Int) {
        self.count = count
    }
    
    func move() {
        // Use ? for optional function in protocol
        if let newCount = moveDelegate?.move?(count) {
            count = newCount
        }
    }
}

let counter = Counter(count: -3)
counter.moveDelegate = MoveToZero()

print()
while counter.count != 0 {
    counter.move()
    print(counter.count)
}


////////////////////////////////////////////////////////////////////////////////
// Protocol Extensions

extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}


////////////////////////////////////////////////////////////////////////////////
// Provide Default Implementations Using Extensions

protocol PrettyTextRepresentable: TextualRepresentable {}

extension PrettyTextRepresentable {
    var prettyTexualRepresentable: String {
        return textualDescription
    }
}


////////////////////////////////////////////////////////////////////////////////
// Adding Constraints to Protocol Extensions

// When define a protocol extension, could specify constraints 
//   that conforming types must satisfy.

// Define an extension to the CollectionType protocol that applies to any
//   collection whose elements conform to the TextRepresentable protocol above.
extension CollectionType where Generator.Element: TextualRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joinWithSeparator(", ") + "]"
    }
}

let collection = [
    Dice(sides: 6, generator: LinearCongruentialGenerator()),
    Dice(sides: 12, generator: LinearCongruentialGenerator())
]

print()
print(collection.textualDescription)
