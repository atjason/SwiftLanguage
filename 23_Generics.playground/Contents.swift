
////////////////////////////////////////////////////////////////////////////////
// Generic Fuctions

func swapTwoValues<T>(inout a: T, inout _ b: T) {
    (a, b) = (b, a)
}

var a = 1
var b = 2

swapTwoValues(&a, &b)

a // 2
b // 1


////////////////////////////////////////////////////////////////////////////////
// Generic Types

struct Stack<Element> {
    var items = [Element]()
    
    mutating func push(item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfString = Stack<String>()
stackOfString.push("Hello")
stackOfString.push("World")
stackOfString.pop() // World


////////////////////////////////////////////////////////////////////////////////
// Extending a Generic Type

// When extend a generic type, no need to provide a type parameter list.
// e.g., no need to declare "Element" again.

extension Stack {
    var topItem: Element? {
        return items.count > 0 ? items[0] : nil
    }
}


////////////////////////////////////////////////////////////////////////////////
// Type Constraints

func findIndex<T: Equatable>(items: [T], itemToFind: T) -> Int? {
    
    for (index, item) in items.enumerate() {
        if item == itemToFind {
            return index
        }
    }
    
    return nil
}


////////////////////////////////////////////////////////////////////////////////
// Associated Type

// When defining a protocol, it's sometimes useful to declare associated types.
// An associated type gives a placeholder name to a type.
// The actual type to use is not specified until the protocol is adopted.

protocol Container {
    // Declare a placeholder name to a type
    associatedtype ItemType
    
    var count: Int { get }
    
    mutating func append(item: ItemType)
    
    subscript(index: Int) -> ItemType { get }
}

extension Stack: Container {
    // Declare the actual type
    typealias ItemType = Element
    
    var count: Int {
        return items.count
    }
    
    mutating func append(item: ItemType) {
        push(item)
    }
    
    subscript(index: Int) -> ItemType {
        return items[index]
    }
}

extension Array: Container {}


////////////////////////////////////////////////////////////////////////////////
// Where Clauses

func allItemsMatch<C1: Container, C2: Container
    where C1.ItemType == C2.ItemType, C1.ItemType: Equatable>
    (containerA: C1, containerB: C2) -> Bool {
    
    if containerA.count != containerB.count {
        return false
    }
    
    for index in 0..<containerA.count {
        if containerA[index] != containerB[index] {
            return false
        }
    }
    
    return true
}

var stackOfInt = Stack<Int>()
stackOfInt.push(1)
stackOfInt.append(2)

var arrayOfInt = [1, 2]

allItemsMatch(stackOfInt, containerB: arrayOfInt) // true
