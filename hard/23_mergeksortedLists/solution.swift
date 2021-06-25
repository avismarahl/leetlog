/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var sortedNodes = [ListNode]()
        var curMap = [Int: ListNode]()
        for i in 0 ..< lists.count {
            curMap[i] = lists[i]
        }
        if curMap.keys.count == 0 {
            return nil
        }
        while curMap.keys.count > 0 {
            var minNodes = [ListNode]()
            var minVal: Int = Int.max
            var minKeys: [Int] = [Int]()
            for (key, value) in curMap {
                if minVal > value.val {
                    minVal = value.val
                    minNodes.removeAll()
                    minKeys.removeAll()
                    minNodes.append(value)
                    minKeys.append(key)
                } else if minVal == value.val {
                    minKeys.append(key)
                    minNodes.append(value)
                }
            }
            sortedNodes.append(contentsOf: minNodes)
            for i in 0 ..< minKeys.count {
                curMap[minKeys[i]] = minNodes[i].next
            }
        }
        if sortedNodes.count == 1 {
            return sortedNodes[0]
        }
        for i in 0 ..< sortedNodes.count {
            if i == sortedNodes.count - 1 {
                sortedNodes[i].next = nil
                break
            }
            sortedNodes[i].next = sortedNodes[i + 1]
        }
        return sortedNodes[0]
    }
}