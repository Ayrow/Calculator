

import Foundation

// Retuns last character if it exists
// Otherwise return an empty string

func getLastChar(str: String) -> String {
    return str.isEmpty ? "" : String(str.last!)
}

// return true if last character of str is is equal to char
func lastCharIsEqualTo(str: String, char: String) -> Bool {
    let last = getLastChar(str: str)
    return last == char
}


func formatResult(val: Double) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    numberFormatter.maximumFractionDigits = 16
    let result = numberFormatter
        .string(
            from: NSNumber(value: val))
    
    return result ?? "0"
}
