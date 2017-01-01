//: [Previous](@previous)

import Foundation

 /* 5.1
 You are given two 32-bit numbers, N and M, and two bit positions, i and j Write 
 a method to set all bits between i and j in N equal to M (e g , M becomes a sub
 string of N located at i and starting at j)
 EXAMPLE:
 Input: N = 10000000000, M = 10101, i = 2, j = 6
 Output: N = 10001010100
 */

func updateBits(n: Int, m: Int, i: Int, j: Int) -> Int {
    let left = -1 << (j+1)
    let right = (1 << i) - 1
    let mask = right | left
    
    return (n & mask) | (m << i)
}

updateBits(n: 1024, m: 19, i: 2, j: 6)

//: [Next](@next)
