class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        return find(startIndex: 0, endIndex: nums.count - 1, a: nums, target: target)
    }
    
    func binarySearch(_ start: Int, _ end: Int, _ a: [Int], _ target: Int) -> Int {
        if start > end {
            return -1
        }
        let mid = (start + end)/2
        if a[mid] == target {
            return mid
        }
        let left = binarySearch(start, mid - 1, a, target)
        if left != -1 {
            return left
        }
        return binarySearch(mid + 1, end, a, target)
    }
    
    func find(startIndex: Int, endIndex: Int, a: [Int], target: Int) -> Int {
        if startIndex > endIndex {
            return -1
        } else if startIndex == endIndex {
            if target == a[startIndex] {
                return startIndex
            }
            return -1
        }
        if a[startIndex] < a[endIndex] {
            if target >= a[startIndex] && target <= a[endIndex] {
                return binarySearch(startIndex, endIndex, a, target)
            }
            return -1
        }
        if a[startIndex] > a[startIndex + 1] {
            if a[startIndex] == target {
                return startIndex
            }
            if target >= a[startIndex + 1] && target <= a[endIndex] {
                return binarySearch(startIndex, endIndex, a, target)
            }
            return -1
        }
        let mid = (startIndex + endIndex)/2
        if a[mid] == target {
            return mid
        }
        let leftPivot = find(startIndex: startIndex, endIndex: mid, a: a, target: target)
        let rightPivot = find(startIndex: mid + 1, endIndex: endIndex, a: a, target: target)
        if leftPivot == -1 && rightPivot == -1 {
            return -1
        }
        if leftPivot == -1 {
            return rightPivot
        }
        return leftPivot
    }
}