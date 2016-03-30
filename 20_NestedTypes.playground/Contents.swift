

////////////////////////////////////////////////////////////////////////////////
// Nested Types

// It can be convenient to define utility classes and structures 
//   purely for use within the context of a more complex type.

class Person {
    enum Sex {
        case Man
        case Woman
    }
    
    let sex: Sex
    
    init(sex: Sex) {
        self.sex = sex
    }
}

let person = Person(sex: Person.Sex.Man)

person.sex // Man
