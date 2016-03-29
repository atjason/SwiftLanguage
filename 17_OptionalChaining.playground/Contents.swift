
////////////////////////////////////////////////////////////////////////////////
// Optional Chaining

class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 2
    
    func printNumberOfRooms() {
        print("\(numberOfRooms) rooms")
    }
}

let person = Person()

if person.residence?.printNumberOfRooms() == nil {
    print("No room find")
}

person.residence = Residence()

if person.residence?.printNumberOfRooms() != nil {
    print("You can see the number of rooms now.")
}
