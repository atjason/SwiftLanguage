

////////////////////////////////////////////////////////////////////////////////
// Defining a Class Hierarchy for Type Casting

class MediaItem {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    
    init(name: String, director: String) {
        self.director = director
        
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    
    init(name: String, artist: String) {
        self.artist = artist
        
        super.init(name: name)
    }
}


////////////////////////////////////////////////////////////////////////////////
//

let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley")
]

var movieCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    }
    
    if let song = item as? Song {
        print("Song: \(song.name), by \(song.artist)")
    }
}

movieCount // 1


////////////////////////////////////////////////////////////////////////////////
// Type Casting for AnyObject and Any

// AnyObject can represent an instance of any class type.
// Any can represent an instance of any type at all, including function types.

let someObjects: [AnyObject] = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Movie(name: "Moon", director: "Duncan Jones")
]

for object in someObjects {
    let movie = object as! Movie
    print("Movie: \(movie.name), by \(movie.director)")
}

for movie in someObjects as! [Movie] {
    print("Movie: \(movie.name), by \(movie.director)")
}

var things = [Any]()

things.append(0)
things.append(1)
things.append(0.0)
things.append(3.14)
things.append("Hello World!")
things.append((3, 5))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in
    return "Hello, \(name)"
})

for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    
    case let num as Int:
        print("an integer value of \(num)")
        
    case 0.0 as Double:
        print("zero as a Double")
        
    case let num as Double where num > 0:
        print("a positive Double value of \(num)")
    
    case is Double:
        print("some other double")
        
    case let str as String:
        print("a string value of \(str)")
        
    case let (x, y) as (Int, Int):
        print("an (x, y) point at (\(x), \(y))")
        
    case let movie as Movie:
        print("a movie called \(movie.name), dir. \(movie.director)")
        
    case let stringConverter as String -> String:
        print(stringConverter("World"))
        
    default:
        print("something else")
    }
}
