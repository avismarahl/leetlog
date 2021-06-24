class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 {
            return s
        }
        var result = [[Character]]()
        let sArray = Array(s)
        var k = 0
        for _ in 0 ..< numRows {
            let arr = [Character](repeating: " ", count: sArray.count)
            result.append(arr)
        }
        for column in 0 ..< Int.max {
            if k == sArray.count {
                break
            }
            for row in 0 ..< numRows {
                if k == sArray.count {
                    break
                }
                if column % (numRows - 1) == 0 {
                    result[row][column] = sArray[k]
                    k = k + 1
                } else if (row + column) % (numRows - 1) == 0 {
                    result[row][column] = sArray[k]
                    k = k + 1
                }
            }
        }
        var returnString = ""
        for row in 0 ..< numRows {
            for column in 0 ..< sArray.count {
                if result[row][column] != " " {
                    returnString = returnString + String(result[row][column])
                    if returnString.count == s.count {
                        return returnString
                    }
                }
            }
        }
        fatalError()
    }
}