
func swapArray<T>(inout array: [T]) {
    swap(&array[0], &array[1])
}

////////////////////////////////////////////////////////////////////////////////
// Array of Non-Class Type

var numArray1 = [0, 1]
var numArray2 = numArray1 // numArray2 is copied from numArray1

swap(&numArray1[0], &numArray1[1])
numArray1 // [1, 0]
numArray2 // [0, 1] numArray2 is not affected when numArray1 changed

swapArray(&numArray2)
numArray1 // [1, 0] numArray1 is not affected when numArray2 changed
numArray2 // [1, 0]

numArray1[0] = 2
numArray1 // [2, 0]
numArray2 // [1, 0] Note: change value in array1 doesn't affect array2

func changeNumArray(inout numArray: [Int]) {
  numArray[0] = 9
}

changeNumArray(&numArray2)
numArray1 // [2, 0]
numArray2 // [9, 0] Note: change value in array1 doesn't affect array2

////////////////////////////////////////////////////////////////////////////////
// Array of Class Type

class Person {
  var name = ""
  
  init(_ name: String) {
    self.name = name
  }
}

var classArray1 = [Person("A"), Person("B")]
var classArray2 = classArray1 // The references of elements in classArray1 are copied to classArray2.

swap(&classArray1[0], &classArray1[1])
classArray1 // [B, A]
classArray2 // [A, B] As just reference changed, the value of element didn't change.

swapArray(&classArray2)
classArray1 // [B, A] As just reference changed, the value of element didn't change.
classArray2 // [B, A]

classArray1[0].name = "C"
classArray1 // [C, A]
classArray2 // [C, A] Note: The reference to class is not changed. But the content in reference is changed.

func changeClassArray(inout classArray: [Person]) {
  classArray[0].name = "Z"
}

changeClassArray(&classArray2)
classArray1 // [Z, A] Note: The reference to class is not changed. But the content in reference is changed.
classArray2 // [Z, A]
