class Solution {
    var memo = [String: Int]()
    func findPaths(_ m: Int, _ n: Int, _ maxMove: Int, _ startRow: Int, _ startColumn: Int) -> Int {
        if maxMove < 0 {
            return 0
        }
        if startRow < 0 || startColumn < 0 || startRow >= m || startColumn >= n  {
            return 1
        }
        let leftKey = "\(startRow)|\(startColumn - 1)|\(maxMove - 1)"
        let rightKey = "\(startRow)|\(startColumn + 1)|\(maxMove - 1)"
        let upKey = "\(startRow - 1)|\(startColumn)|\(maxMove - 1)"
        let downKey = "\(startRow + 1)|\(startColumn)|\(maxMove - 1)"
        
        var leftCount: Int
        if let count = memo[leftKey] {
            leftCount = count
        } else {
            leftCount = findPaths(m, n, maxMove - 1, startRow, startColumn - 1)
            memo[leftKey] = leftCount
        }
        
        var rightCount: Int
        if let count = memo[rightKey] {
            rightCount = count
        } else {
            rightCount = findPaths(m, n, maxMove - 1, startRow, startColumn + 1)
            memo[rightKey] = rightCount
        }
        
        var upCount: Int
        if let count = memo[upKey] {
            upCount = count
        } else {
            upCount = findPaths(m, n, maxMove - 1, startRow - 1, startColumn)
            memo[upKey] = upCount
        }
        
        var downCount: Int
        if let count = memo[downKey] {
            downCount = count
        } else {
            downCount = findPaths(m, n, maxMove - 1, startRow + 1, startColumn)
            memo[downKey] = downCount
        }
        return (leftCount + rightCount + upCount + downCount) % (1000000000 + 7)
    }
}