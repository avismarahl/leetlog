class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var i = 0
        var j = height.count - 1
        var maxArea = 0
        while i < j {
            var lowerBound = height[i]
            var upperBound = height [j]
            if lowerBound > upperBound {
                if maxArea < upperBound * (j - i) {
                    maxArea = upperBound * (j - i)
                }
                j = j - 1
            } else {
                if maxArea < lowerBound * (j - i) {
                    maxArea = lowerBound * (j - i)
                }
                i = i + 1
            }
        }
        return maxArea
    }
}