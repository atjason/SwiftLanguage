
import Cocoa

////////////////////////////////////////////////////////////////////////////////
// Empty String

let anEmptyString = ""
let anotherEmptyString = String()

if anEmptyString.isEmpty {
    print("Yes, it's empty.")
}

////////////////////////////////////////////////////////////////////////////////
// Copy when assign a String

var nameA = "Tom"
var nameB = nameA
nameB = "Jack"
print(nameA) // nameA is still "Tom".

////////////////////////////////////////////////////////////////////////////////
// Characters

for char in "Hello".characters {
    print(char, terminator: "")
}
print()

////////////////////////////////////////////////////////////////////////////////
// Concatenate

var hello = "Hello"
hello += " World!"

hello = "Hello"
hello.appendContentsOf(" World")
hello.append(Character("!"))

////////////////////////////////////////////////////////////////////////////////
// Interpolation

var name = "Tom"
var sayName = "My name is \(name)."

////////////////////////////////////////////////////////////////////////////////
// Index

var helloWorld = "Hello World!"
helloWorld.characters[helloWorld.startIndex] // H
helloWorld.characters[helloWorld.startIndex.successor()] // e
helloWorld.characters[helloWorld.startIndex.advancedBy(1)] // e
helloWorld.characters[helloWorld.endIndex.advancedBy(-1)] // !
helloWorld.characters[helloWorld.endIndex.predecessor()] // !

for index in helloWorld.characters.indices {
    print("\(helloWorld[index])", terminator: "")
}
print()

////////////////////////////////////////////////////////////////////////////////
// Insert and Remove

var welcome = "Hello"

welcome.insert("!", atIndex: welcome.endIndex) // Hello!
welcome.insertContentsOf(" World".characters,
                         at: welcome.startIndex.advancedBy(5)) // Hello World!
welcome.removeAtIndex(welcome.endIndex.predecessor()) // Hello World
let range = welcome.startIndex.advancedBy(5)..<welcome.endIndex
welcome.removeRange(range)

////////////////////////////////////////////////////////////////////////////////
// Prefix Suffix

let fullName = "Tom Wang"
fullName.hasPrefix("Tom") // true
fullName.hasSuffix("Wang") // true





