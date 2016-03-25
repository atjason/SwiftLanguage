
import Cocoa

////////////////////////////////////////////////////////////////////////////////
// Arithmetic Operators

1 + 1 // 2
5 - 3 // 2
1 * 2 // 2
4 / 2 // 2
5 / 2 // 2 Note: the remainder is just dropped.
6 % 4 // 2
-6 % 4 // -2
6 % -4 // 2
5.3 % 2.5 // ~0.3

var num = 1
num += 1 // 2

////////////////////////////////////////////////////////////////////////////////
// ??

// Typical usage of ?? is to choose default value.

let defaultColorName = "Red"
var userDefinedColorName: String? = nil

var colorNameToUse: String?
colorNameToUse = userDefinedColorName ?? defaultColorName // "Red"

userDefinedColorName = "Green"
colorNameToUse = userDefinedColorName ?? defaultColorName // "Green"

////////////////////////////////////////////////////////////////////////////////
// Range Operators: ... and ..<

for index in 1...3 {
    print(index) // Get 1, 2, 3
}

let names = ["Tom", "Jack"]
for index in 0..<names.count {
    print(names[index])
}
