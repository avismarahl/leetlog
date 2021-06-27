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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var nodes = [ListNode]()
        var cur = head
        while(cur != nil) {
            nodes.append(cur!)
            cur = cur!.next
        }
        if (n == nodes.count ) {
            if nodes.count > 1 {
                return nodes[1]
            }
            return nil
        }
        nodes[nodes.count - n - 1].next = nodes[nodes.count - n].next
        return head
    }
}