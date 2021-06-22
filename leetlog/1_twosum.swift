/*
 
 https://leetcode.com/problems/two-sum/
 
 1. Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target. You may assume that each input would have exactly one solution, and you may not use the same element twice. You can return the answer in any order.
 
 */

import Foundation
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var map = [Int: Int]()
    var i = 0
    for num in nums {
        map[num] = i
        i = i + 1
    }
    i = 0
    for num in nums {
        if let otherIndex = map[target - num], otherIndex != i {
            return [i, otherIndex]
        }
        i = i + 1
    }
    return []
}
