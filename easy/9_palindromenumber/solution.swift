class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        }
        if x == reverse(x) {
            return true
        }
        return false
    }
    
    func reverse(_ x: Int) -> Int {
        var copyX = x
        var unit = 1
        var sum = 0
        while copyX >= 10 {
            copyX = copyX / 10
            unit = unit * 10
        }
        copyX = x
        while copyX > 0 {
            let remainder = copyX % 10
            copyX = copyX / 10
            sum = sum + remainder * unit
            unit = unit / 10
        }
        return sum
    }
}