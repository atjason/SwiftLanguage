
////////////////////////////////////////////////////////////////////////////////
// Weak Reference

// Use a weak reference for an optional reference.

class Person {
    var name: String
    
    // This is the optional reference.
    weak var friend: Person?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is deinitialized.")
    }
}

var personA: Person? = Person(name: "Tom")
var personB: Person? = Person(name: "Jack")

personA?.friend = personB
personB?.friend = personA

personA = nil
personB = nil


////////////////////////////////////////////////////////////////////////////////
// Unowned Reference

// Use an unowned reference for a non-optional reference.

class Customer {
    var name: String
    
    var card: CreditCard?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is deinitialized.")
    }
}

class CreditCard {
    var cardNo: UInt64
    
    // This is the non-optional reference.
    unowned var customer: Customer
    
    init(cardNo: UInt64, customer: Customer) {
        self.cardNo = cardNo
        self.customer = customer
    }
    
    deinit {
        print("\(cardNo) is deinitialized.")
    }
}

print()

var goldCustomer: Customer? = Customer(name: "Jobs")
var goldCard: CreditCard? = CreditCard(cardNo: 8888_8888_8888_8888,
                                       customer: goldCustomer!)

goldCustomer?.card = goldCard

goldCustomer = nil

// As goldCard?.customer (i.e.g, original goldCustomer is deinitialied),
//   this will cause runtime error.
// goldCard?.customer.name

goldCard = nil


////////////////////////////////////////////////////////////////////////////////
// Combine Weak and Unowned Reference

// When both properties should not be nil, combine 
//   an unowned property on one class
//   with 
//   an implicitly unwrapped optional property on the other class.

class Country {
    let name: String
    
    // This is the implicitly unwrapped optional reference.
    var capitalCity: City!
    
    init(name: String, cityName: String) {
        self.name = name
        self.capitalCity = City(name: cityName, country: self)
    }
    
    deinit {
        print("\(name) is deinitialized.")
    }
}

class City {
    let name: String
    
    // This is the unowned reference.
    unowned let country: Country
    
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
    
    deinit {
        print("\(name) is deinitialized.")
    }
}

print()

var country: Country? = Country(name: "China", cityName: "Beijing")

country = nil


////////////////////////////////////////////////////////////////////////////////
// Resolving Strong Reference Cycles for Closures

class HTMLElement {
    var name: String
    var text: String?
    
    lazy var asHTML: () -> String = {
        [unowned self] in // weak delegate = self.delegate!
        
        if let text = self.text {
            return "<\(self.name)>" + text + "</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String?) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is deinitialized.")
    }
}

print()

var element: HTMLElement? = HTMLElement(name: "p", text: "Hello World!")

print(element!.asHTML())

// Why define the asHTML as a closure property rather than an instance method?
// As if so, you can replace this property with a custom closure.
// Example: set default string for h1 if the text is nil

element = HTMLElement(name: "h1", text: nil)

element!.asHTML = {
    // It's on doesn't define a capture list again
    // [weak element = element!] in
    let str = element!.text ?? "Default Title"
    return "<\(element!.name)>" + str + "</\(element!.name)>"
}

print()
print(element!.asHTML())

element = nil
