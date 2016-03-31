

////////////////////////////////////////////////////////////////////////////////
// Access Control

// Note:
//   For a single-target app, no need to specify explicit access control levels.
//   There are a lot of rules. It's better read the rule again when use it.


////////////////////////////////////////////////////////////////////////////////
// Access Levels

// Public access 
//   Enables to be used within any source file from their defining module,
//   and also from another module that imports the defining module.
//   Typically use when specifying the public interface to a framework.

// Internal access 
//   Enables to be used within any source file from their defining module,
//   but not in any source file outside of that module. 
//   Typically use when defining “an app’s or a framework’s internal structure.

// Private access 
//   Restricts the use of an entity to its own defining source file.
//   Use to hide the implementation details of a specific piece of functionality.


////////////////////////////////////////////////////////////////////////////////
// Guiding Principle of Access Levels

// Access levels in Swift follow an overall guiding principle: 
//   Can't define an entry in terms of another one that has lower access level.

// For example:
//
// A public variable cannot be defined in an internal or private type,
//   as the type might not be available everywhere that the public variable is used.
// A function cannot have higher access level than its parameter or return type,
//   as the function could be used when its constituent types are not available.


////////////////////////////////////////////////////////////////////////////////
// Default Access Levels: internal

// All entities have a default access level of internal.
//   (with a few specific exceptions, as described later in this chapter)

////////////////////////////////////////////////////////////////////////////////
// Access Levels for Unit Test Targets

// Unit test target can access any internal entity, if 
//   mark the import declaration with the @testable attribute
//   and compile that product module with testing enabled.


////////////////////////////////////////////////////////////////////////////////
// Custom Types

public class SomePublicClass {          // explicitly public class
    public var somePublicProperty = 0   // explicitly public class member
    var someInternalProperty = 0        // implicitly internal class member
    private func somePrivateMethod() {} // explicitly private class member
}

class SomeInternalClass {               // implicitly internal class
    var someInternalProperty = 0        // implicitly internal class member
    private func somePrivateMethod() {} // explicitly private class member
}

private class SomePrivateClass {        // explicitly private class
    var somePrivateProperty = 0         // implicitly private class member
    func somePrivateMethod() {}         // implicitly private class member
}


////////////////////////////////////////////////////////////////////////////////
// Subclass

internal class A {
    private func someMethod() {}
}

// A subclass cannot have a higher access level than its superclass.
internal class B1: A {
    // An override can make an inherited class member
    //   more accessible than its superclass version.
    override internal func someMethod() {}
}

internal class B2: A {
    // A subclass member can call a superclass member 
    //   that has lower access permissions than the subclass member.
    override private func someMethod() {
        super.someMethod()
    }
}


////////////////////////////////////////////////////////////////////////////////
// Getters adn Setters

// Can give a setter a lower access level than its corresponding getter, 
//   to restrict the read-write scope of that variable, property, or subscript.

public struct TrackedString {
    public private(set) var numberOfEdits = 0
    
    public var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
    
    public init() {}
}

var trackedString = TrackedString()
trackedString.value = "Hello"
trackedString.value = "Swift"
trackedString.numberOfEdits // 2

// Can   modify private entry from same source file.
// Can't modify private entry from another source file.
trackedString.numberOfEdits = 3
