
import Cocoa

// Arrays are ordered collections of values.
// Sets are unordered collections of unique values.
// Dictionaries are unordered collections of key-value associations.

////////////////////////////////////////////////////////////////////////////////
// Create Array

let array1 = [Int]()
let array2 = [Int](count: 2, repeatedValue: 3) // [3, 3]
let array3 = [1, 2]

////////////////////////////////////////////////////////////////////////////////
// Accessing and Modifying an Array

var numArray = [1, 2, 3]

// Access
numArray[0] // 0

numArray.isEmpty
numArray.count
numArray.contains(2)

// Modify
numArray[0] = 0
// Note: the length of replacement can be different from the original one.
numArray[0...2] = [1, 2, 3, 4]

// Add
numArray.insert(1, atIndex: 1)
numArray.append(4)
numArray += [5]

// Remove
numArray.removeAtIndex(1)
numArray.removeFirst()
numArray.removeLast()

////////////////////////////////////////////////////////////////////////////////
// Iterating over an Array

for num in numArray {
    print(num)
}

for (index, num) in numArray.enumerate() {
    print("\(index): \(num)")
}


////////////////////////////////////////////////////////////////////////////////
// Create Set

let letters1 = Set<Character>()
let letters2: Set<Character> = ["a", "b"]
let letters3: Set = [1, 2, 3]

////////////////////////////////////////////////////////////////////////////////
// Accessing and Modifying a Set

var numSet: Set = [1, 2, 3]

// Access
numSet.isEmpty
numSet.count
numSet.contains(1)

// Modify

// Add
numSet.insert(4)

// Remove
let number: Int? = numSet.remove(5) // Return nil if no 5 inside

////////////////////////////////////////////////////////////////////////////////
// Iterating over a Set

for num in numSet {
    print(num)
}

for num in numSet.sort() {
    print(num)
}

////////////////////////////////////////////////////////////////////////////////
// Set Operations

// intersect: the values common to both sets.
// exclusiveOr: the values in either set, but not both.
// union: all of the values in both sets.
// subtract: the values not in the specified set.

let numSet1: Set = [1, 2, 3]
var numSet2: Set = [2, 3, 4]

numSet2.intersect(numSet1).sort() // 2, 3
numSet2.exclusiveOr(numSet1).sort() // 1, 4
numSet2.union(numSet1).sort() // 1, 2, 3, 4
numSet2.subtract(numSet1).sort() // 1

numSet2.subtractInPlace(numSet1) // Note: in this case numSet2 is changed.

numSet2.isSubsetOf(numSet1)
numSet2.isStrictSubsetOf(numSet1)

numSet2.isSupersetOf(numSet1)
numSet2.isStrictSupersetOf(numSet1)

numSet2.isDisjointWith(numSet1) // whether have any values in common.

////////////////////////////////////////////////////////////////////////////////
// Create Dictionary

let dictionary1 = [Int: String]()
let dictionary2 = [1: "Tom", 2: "Jack"]

////////////////////////////////////////////////////////////////////////////////
// Accessing and Modifying a Dictionary

var students = ["Tom": 10, "Jack": 11]

students.isEmpty
students.count

// Access
students["Tom"] // 10
students["Emily"] // nil

if let age = students["Emily"] {
    // do something
}

// Modify
students["Tom"] = 12
students.updateValue(10, forKey: "Tom") // Return original value of 12

// Add
students["Emily"] = 11

// Remove
students["Tom"] = nil
students.removeValueForKey("Tom") // Return nil as it's already removed.

////////////////////////////////////////////////////////////////////////////////
// Iterating over a Dictionary

for (name, age) in students {
    print("\(name) is \(age) years old.")
}

for name in students.keys {
    print("\(name) ", terminator: "")
}
print()

let ages = students.values
for age in ages {
    print("\(age) ", terminator: "")
}
print()
