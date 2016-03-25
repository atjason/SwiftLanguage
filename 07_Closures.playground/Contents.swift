
import Cocoa
import Foundation

/////////////////////////////////////////////////////////////////////////
// Use function as variant

func funcAdd(n1: Int, n2: Int) -> Int {
    return n1 + n2
}

var varAdd1: (Int, n2: Int) -> Int;
varAdd1 = funcAdd
var varAdd2 = funcAdd

varAdd1(1, n2: 2) // 3
varAdd2(1, n2: 2) // 3
funcAdd(1, n2: 2) // 3


/////////////////////////////////////////////////////////////////////////
// Use function as parameter

func threeTimes(number: Int) -> Int {
    return number * 3
}

func doSomethingToANumber(number: Int, thingToDo: (Int) -> Int) -> Int {
    return thingToDo(number)
}

threeTimes(2) // 6
doSomethingToANumber(2, thingToDo: threeTimes) // 6


/////////////////////////////////////////////////////////////////////////
// Create a function

func createAdder(numberToAdd: Int) -> (Int) -> Int {
    func adder(number: Int) -> Int {
        return number + numberToAdd
    }
    
    return adder
}

var addTen = createAdder(10)
addTen(2) // 12


/////////////////////////////////////////////////////////////////////////
// Variant in a function when creating it

func createIncrementor(numberToIncrease: Int) -> () -> Int {
    var amount = 0
    
    func incrementor() -> Int {
        amount += numberToIncrease
        return amount
    }
    
    return incrementor
}

var incrementByOne = createIncrementor(1)
incrementByOne() // 1
incrementByOne() // 2

var incrementByTen = createIncrementor(10)
incrementByTen() // 10
incrementByTen() // 20


/////////////////////////////////////////////////////////////////////////
// Closures

var numbers = [2, 3, 1]

numbers.sort({ (n1: Int, n2: Int) -> Bool in
    return n1 < n2
}) // [1, 2, 3]

numbers.sort({ (n1, n2) -> Bool in
    return n1 < n2
}) // [1, 2, 3]

numbers.sort({ n1, n2 in
    return n1 < n2
}) // [1, 2, 3]

numbers.sort({
    return $0 < $1
}) // [1, 2, 3]

numbers.sort({
    $0 < $1
}) // [1, 2, 3]

numbers.sort() {
    $0 < $1
} // [1, 2, 3]

numbers.sort() { $0 < $1 } // [1, 2, 3]

var comparator = { (n1: Int, n2: Int) -> Bool in n1 < n2 }
numbers.sort(comparator)

func comparator2(n1: Int, n2: Int) -> Bool {
    return n1 < n2
}
numbers.sort(comparator2) // [1, 2, 3]


