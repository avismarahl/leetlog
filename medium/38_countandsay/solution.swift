class Solution {
    func countAndSay(_ n: Int) -> String {
        return countAndSay("1", n - 1)
    }
    
    func countAndSay(_ num: String, _ rem: Int) -> String {
        if rem == 0 {
            return num
        }
        var prevChar = ""
        var curCount = 1
        var res = ""
        for char in num {
            if String(char) == prevChar {
                curCount += 1
            } else if String(prevChar) != "" {
                res = "\(res)\(curCount)\(prevChar)"
                curCount = 1
            }
            prevChar = String(char)
        }
        res = "\(res)\(curCount)\(prevChar)"
        return countAndSay(res, rem - 1)
    }
}