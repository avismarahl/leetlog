class Solution {
    var map = [String: String]()
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        find(candidates, target, [], 0, &result)
        return result
    }
    
    func find(_ candidates: [Int], _ target: Int, _ cumArray: [Int], _ cumSum: Int, _ result: inout [[Int]]) {
        for candidate in candidates {
            if candidate + cumSum == target {
                var key = (cumArray + [candidate]).sorted().map({String($0)}).joined(separator:"|")
                if map[key] == nil {
                    result.append(cumArray + [candidate])
                    map[key] = ""
                }
            } else if candidate + cumSum < target {
                find(candidates, target, cumArray + [candidate], candidate + cumSum, &result)
            }
        }
    }
}