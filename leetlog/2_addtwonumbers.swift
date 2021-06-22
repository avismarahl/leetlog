/*
 https://leetcode.com/problems/add-two-numbers/
 
 2. You are given two non-empty linked lists representing two non-negative integers.
 The digits are stored in reverse order, and each of their nodes contains a single
 digit. Add the two numbers and return the sum as a linked list.
 
 You may assume the two numbers do not contain any leading zero, except the number
 0 itself.
 */



public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var carry = 0
    var resHead: ListNode?
    var resCur: ListNode?
    var l1Cur = l1
    var l2Cur = l2
    while l1Cur != nil || l2Cur != nil {
        var nodeVal: Int!
        if let l1Value = l1Cur?.val, let l2Value = l2Cur?.val {
            nodeVal = l1Value + l2Value + carry
        } else if let l1Value = l1Cur?.val {
            nodeVal = l1Value + carry
        } else if let l2Value = l2Cur?.val {
            nodeVal = l2Value + carry
        }
        if nodeVal >= 10 {
            nodeVal = nodeVal % 10
            carry = 1
        } else {
            carry = 0
        }
        let node = ListNode(nodeVal)
        if resHead == nil {
            resHead = node
        }
        resCur?.next = node
        resCur = node
        l1Cur = l1Cur?.next
        l2Cur = l2Cur?.next
    }
    if carry != 0 {
        let node = ListNode(carry)
        resCur?.next = node
    }
    return resHead
}

