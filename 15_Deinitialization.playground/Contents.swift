
////////////////////////////////////////////////////////////////////////////////
// Deinitialization

// Typically, no need to manually cleanup when instances are deallocated.
// However, when work with own resources, might need to manually cleanup.
//   For example, if you create a custom class to open a file and
//   write some data to it, you might need to close the file before 
//   the class instance is deallocated.

// Superclass's deinitializer is called automatically at the end of 
//   a subclass deinitializer implementation.

class SomeClass {
    deinit {
        print("deinit in SomeClass.")
    }
}

class SomeSubClass: SomeClass {
    deinit {
        print("deinit in SomeSubClass.")
    }
}

var classA = SomeSubClass()
var classB = SomeSubClass()
classB = classA // The old instance of classB will be deinitialized.
