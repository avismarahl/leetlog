

**Solution:**

A bruteforce <code>O(n<sup>2</sup>)</code> solution involves checking every possible pair to see if they add upto `target`. We are not going for this solution here. 

The solution involves two iterations of `nums` array: 

- In the first iteration, we populate a hashmap with `nums[i]` as the key and `i` as the value. 

```swift
for num in nums {
  map[num] = i
  i = i + 1
}
```

- In the second iteration, we rely on the following deduction: *since only one valid answer exists, there must be an entry inside the dictionary that is equal to* `target - nums[i]`. We iterate till we find that `num[i]`, while being mindful of the fact that `map[target - num[i]]` is not equal to `i` itself.

```swift
for num in nums {
  if let otherIndex = map[target - num], otherIndex != i {
    return [i, otherIndex]
  }
  i = i + 1
}
```
This way we find a solution that is `O(n)`. However, we're now taking up to `O(n)` space – as opposed to constant space in the bruteforce solution. 

