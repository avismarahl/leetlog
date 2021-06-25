class Solution {
    func reverse(_ x: Int) -> Int {
        var sign = 1
        var copyX: UInt32 = negateIfRequired(x)
        if x < 0 {
            sign = -1
        }
        var unit: UInt32 = 1
        var sum: UInt32 = 0
        while copyX >= 10 {
            copyX = copyX / 10
            unit = unit * 10
        }
        print(unit)
        copyX = negateIfRequired(x)
        while copyX > 0 {
            let remainder: UInt32 = copyX % 10
            copyX = copyX / 10
            if unit >= 1000000000 && remainder >= 3 {
                return 0
            }
            if sum + remainder * unit >= Int32.max - 1 {
                return 0
            }
            sum = sum + remainder * unit
            unit = unit / 10
        }
        return Int(sum) * sign
    }
    
    func negateIfRequired(_ x: Int) -> UInt32 {
        if x < 0 {
            return UInt32(x * -1)
        }
        return UInt32(x)
    }
}