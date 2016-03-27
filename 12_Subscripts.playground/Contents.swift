
////////////////////////////////////////////////////////////////////////////////
//

// Classes, structures, and enumerations can define subscripts, which are 
// shortcuts for the member elements of a collection, list, or sequence.

struct MyArray {
    var array = [Int]()
    
    subscript(index: Int) -> Int? {
        get {
            if index >= 0 && index < array.count {
                return array[index]
                
            } else {
                return nil
            }
        }
        
        set {
            if let value = newValue {
                if index >= 0 && index < array.count {
                    array[index] = value
                    
                } else {
                    print("Error: the index is out of range.")
                }

                
            } else {
                print("Error: can't assign a nil to Int.")
            }
        }
    }
}

var myArray = MyArray(array: [1, 2, 3])

myArray[0]          // 1
myArray[0] = 0      // 0
myArray[0] = nil    // Error: can't assign a nil to Int.

myArray[5]          // nil
myArray[5] = 0      // Error: the index is out of range.
