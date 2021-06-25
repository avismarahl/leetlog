class Solution {
    var unit: [Character: String] = [
        "1": "One",
        "2": "Two",
        "3": "Three",
        "4": "Four",
        "5": "Five",
        "6": "Six",
        "7": "Seven",
        "8": "Eight",
        "9": "Nine",
        "0": ""
    ]
    var ten: [Character: String] = [
        "2": "Twenty",
        "3": "Thirty",
        "4": "Forty",
        "5": "Fifty",
        "6": "Sixty",
        "7": "Seventy", 
        "8": "Eighty", 
        "9": "Ninety"
    ]
    var specialTens: [String: String] = [
        "10": "Ten",
        "11": "Eleven",
        "12": "Twelve",
        "13": "Thirteen",
        "14": "Fourteen",
        "15": "Fifteen",
        "16": "Sixteen",
        "17": "Seventeen",
        "18": "Eighteen",
        "19": "Nineteen",
    ]
    
    func numberToWords(_ num: Int) -> String {
        if num == 0 {
            return "Zero"
        }
        var numString = String(num)
        var leadingZero = numString.length % 3
        if leadingZero == 1 {
            numString = "00" + numString
        } else if leadingZero == 2 {
            numString = "0" + numString
        }
        var heavies = ["Hundred", "Thousand", "Million", "Billion"]
        if numString.count == 3 {
            heavies = ["Hundred"]
        }
        if numString.count == 6 {
            heavies = ["Thousand", "Hundred"]
        }
        if numString.count == 9 {
            heavies = ["Million", "Thousand", "Hundred"]
        }
        if numString.count == 12 {
            heavies = ["Billion", "Million", "Thousand", "Hundred"]
        }
        let numArray = Array(numString) 
        return translate(numArray, heavies)
    }
    
    func translate(_ string : [Character], _ heavies: [String]) -> String {
        if heavies.count == 1 {
            return hundred([string[0], string[1], string[2]])
        }
        let left = hundred([string[0], string[1], string[2]])
        let right = translate(Array(string[3 ..< string.count]), Array(heavies[1 ..< heavies.count]))
        if left != "" {
            return "\(left) \(heavies[0]) \(right)".trimmingCharacters(in: .whitespacesAndNewlines)
        }
        return right
    }
    
    func hundred(_ string: [Character]) -> String {
        var result: String = ""
        if string[0] != "0" {
            result = "\(unit[string[0]]!) Hundred"
        }
        if string[1] == "1" {
            result = "\(result) \(specialTens["\(string[1])\(string[2])"]!)" 
            return result.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        if string[1] != "0" {
            result = "\(result) \(ten[string[1]]!)"
        }
        if string[2] != "0" {
            result = "\(result) \(unit[string[2]]!)"
        }
        return result.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}