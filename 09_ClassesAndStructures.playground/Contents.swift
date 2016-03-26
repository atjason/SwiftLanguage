
import Cocoa

////////////////////////////////////////////////////////////////////////////////
// Definition Syntax

struct Resolution {
    var width = 0
    var heigth = 0
}

class VideoMode {
    var resolution = Resolution()
    var name: String = ""
}

let hdResolution = Resolution(width: 1280, heigth: 720)
let hdVideo = VideoMode()

hdVideo.resolution = hdResolution
hdVideo.name = "HD"

////////////////////////////////////////////////////////////////////////////////
// Structures and Enumerations Are Value Types

// A value type is a type whose value is copied when it is assigned to
//   a variable or constant, or when it is passed to a function.

var resolutionA = Resolution(width: 1280, heigth: 720)
var resolutionB = resolutionA

resolutionB.width = 1920
resolutionB.heigth = 1080

resolutionA.width // 1280

////////////////////////////////////////////////////////////////////////////////
// Classes Are Reference Types

// A reference to the same existing instance is used when they are assigned
//   to a variable or constant, or when they are passed to a function.

var videoModeA = VideoMode()
var videoModeB = videoModeA

videoModeA.name = "HD"
videoModeB.name // HD

if videoModeA === videoModeB {
    print("They refer to same instance.")
}

////////////////////////////////////////////////////////////////////////////////
// Comparing Classes and Structures

// Classes and structures in Swift have many things in common. Both can:
// - Define properties to store values
// - Define methods to provide functionality
// - Define subscripts to provide access to their values using subscript syntax
// - Define initializers to set up their initial state
// - Be extended to expand their functionality beyond a default implementation
// - Conform to protocols to provide standard functionality of a certain kind
//
// Classes have additional capabilities that structures do not:
// - Inheritance enables one class to inherit the characteristics of another.
// - Type casting enables you to check the type of a class instance at runtime.
// - Deinitializers enable an instance of a class to free up resources.
// - Reference counting allows more than one reference to a class instance.

////////////////////////////////////////////////////////////////////////////////
// Choosing Between Classes and Structures”
//
// In most cases, use class.
//
// In these cases, use struct.
// - It need to be copied when assign or as parameter or as return value.
// - Any properties inside are value types.
// - Don't need to inherit properties or behavior from another existing type.
// Note: struct is mainly to encapsulate a few relatively simple data values.
//
// Examples of good candidates for structures:
// - The point location, struct Point { x: Int; y: Int }
// - The size of a shape, struct Rect { width: Double; Height: Double }
