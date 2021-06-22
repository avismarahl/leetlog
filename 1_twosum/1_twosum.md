<div><p>Given an array of integers <code>nums</code>&nbsp;and an integer <code>target</code>, return <em>indices of the two numbers such that they add up to <code>target</code></em>.</p><p>You may assume that each input would have <strong><em>exactly</em> one solution</strong>, and you may not use the <em>same</em> element twice.</p>

<p>You can return the answer in any order.</p>

<p>&nbsp;</p>
<p><strong>Example 1:</strong></p>

<pre><strong>Input:</strong> nums = [2,7,11,15], target = 9
<strong>Output:</strong> [0,1]
<strong>Output:</strong> Because nums[0] + nums[1] == 9, we return [0, 1].
</pre>


<p><strong>Example 2:</strong></p>

<pre><strong>Input:</strong> nums = [3,2,4], target = 6
<strong>Output:</strong> [1,2]
</pre>


<p><strong>Example 3:</strong></p>

<pre><strong>Input:</strong> nums = [3,3], target = 6
<strong>Output:</strong> [0,1]
</pre>


<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
    <li><code>2 &lt;= nums.length &lt;= 10<sup>4</sup></code></li>
    <li><code>-10<sup>9</sup> &lt;= nums[i] &lt;= 10<sup>9</sup></code></li>
    <li><code>-10<sup>9</sup> &lt;= target &lt;= 10<sup>9</sup></code></li>
    <li><strong>Only one valid answer exists.</strong></li>
</ul>


<p>&nbsp;</p>

<strong>Follow-up:&nbsp;</strong>Can you come up with an algorithm that is less than&nbsp;<code>O(n<sup>2</sup>)&nbsp;</code>time complexity?

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

