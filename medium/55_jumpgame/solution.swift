class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var remJumps = 0
        var i = 0
        while i < nums.count - 1 {
            remJumps = max(remJumps - 1, nums[i])
            if remJumps <= 0 {
                return false
            }
            i += 1
        }
        return true
    }
}