//Violation can happen only if the stack is empty

class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        let stack = Stack()
        var invalidIndices = [Int]()
        var i = 0
        for element in s {
            if element == "(" {
                stack.push(i)
            } else if element == ")" {
                if stack.isEmpty() {
                    invalidIndices.append(i)
                } else {
                    stack.pop()
                }
                
            }
            i = i + 1
        }
        invalidIndices = merge(stack.elements, invalidIndices)
        if invalidIndices.count == 0 {
            return s.count
        }
        if invalidIndices.count == s.count {
            return 0
        }
        var previousElement = -1
        var maxElement = 0
        for i in 0 ..< invalidIndices.count {
            if maxElement < invalidIndices[i] - previousElement - 1 {
                maxElement = invalidIndices[i] - previousElement - 1
            }
            previousElement = invalidIndices[i]
        }
        if maxElement < s.count - 1 - previousElement {
            maxElement = s.count - 1 - previousElement
        }
        return maxElement
    }
}

func merge(_ l1: [Int], _ l2: [Int]) -> [Int] {
    var i = 0, j = 0
    var sortedArray = [Int]()
    while i < l1.count && j < l2.count {
        if l1[i] < l2[j] {
            sortedArray.append(l1[i])
            i = i + 1
        } else if l1[i] > l2[j] {
            sortedArray.append(l2[j])
            j = j + 1
        } else if l1[i] == l2[j] {
            sortedArray.append(l1[i])
            sortedArray.append(l2[j])
            i = i + 1
            j = j + 1
        }
    }
    while i < l1.count {
        sortedArray.append(l1[i])
        i = i + 1
    }
    while j < l2.count {
        sortedArray.append(l2[j])
        j = j + 1
    }
    return sortedArray
}

class Stack {
    var elements = [Int]()
    
    func isEmpty() -> Bool {
        return self.elements.count == 0
    }
    
    func clear() {
        self.elements.removeAll()
    }
    
    func push(_ element: Int) {
        self.elements.append(element)
    }
    
    func pop() -> Int {
        return self.elements.removeLast()
    }
    
    func peek() -> Int? {
        if self.elements.count > 0 {
            return self.elements[self.elements.count - 1]
        }
        return nil
    }
}