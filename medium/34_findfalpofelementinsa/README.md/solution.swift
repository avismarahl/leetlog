class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        return binarySearch(0, nums.count - 1, nums, target)
    }
    
    func binarySearch(_ start: Int, _ end: Int, _ a: [Int], _ target: Int) -> [Int] {
        if start > end {
            return [-1, -1]
        }
        let mid = (start + end)/2
        if a[mid] == target {
            var leftIndex = -1
            var curLeftIndex = mid - 1
            while curLeftIndex >= 0 {
                if a[curLeftIndex] != target {
                    break
                }
                leftIndex = curLeftIndex
                curLeftIndex = curLeftIndex - 1
            }
            
            var rightIndex = -1
            var curRightIndex = mid + 1
            while curRightIndex < a.count {
                if a[curRightIndex] != target {
                    break
                }
                rightIndex = curRightIndex
                curRightIndex = curRightIndex + 1
            }
            if rightIndex == -1 && leftIndex == -1 {
                return [mid, mid]
            }
            if rightIndex == -1 {
                return [leftIndex, mid]
            }
            if leftIndex == -1 {
                return [mid, rightIndex]
            }
            return [leftIndex,rightIndex]
            
        } else if a[mid] < target {
            return binarySearch(mid + 1, end, a, target)
        } else {
            return binarySearch(start, mid - 1, a, target)
        }
    }
}

