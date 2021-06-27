class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        if digits.count == 0 {
            return []
        }
        var digits = Array(digits)
        if digits.count == 1 {
            return map(digits.first!)
        }
        let currentMap = map(digits.first!)
        let previousMap = letterCombinations(String(digits[1 ..< digits.count]))
        var combination = [String]()
        for a in currentMap {
            for b in previousMap {
                combination.append("\(a)\(b)")
            }
        }
        return combination
    }
    func map(_ digit: Character) -> [String] {
        switch digit {
            case "2": return ["a", "b", "c"]
            case "3": return ["d", "e", "f"]
            case "4": return ["g", "h", "i"]
            case "5": return ["j", "k", "l"]
            case "6": return ["m", "n", "o"]
            case "7": return ["p", "q", "r", "s"]
            case "8": return ["t", "u", "v"]
            case "9": return ["w", "x", "y", "z"]
            default: fatalError()
        }
    }
}