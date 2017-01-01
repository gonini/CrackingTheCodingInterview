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

/* 5.2
 Given a (decimal - e g 3 72) number that is passed in as a string, print the bin
 ary rep- resentation If the number can not be represented accurately in binary, 
 print “ERROR”
 */

func printBinary(num: Double) -> String {
    guard num >= 0 && num <= 1 else {
        return "ERROR"
    }
    func createBinary(_ m: Double, depth: Int) -> String {
        if depth > 32 {
            return "X"
        }else  if m == 1.0 {
            return ""
        } else if m > 1.0 {
            return "1" + createBinary(m - 1, depth: depth + 1)
        } else {
            return "0" + createBinary(m * 2, depth: depth + 1)
        }
    }
    let ret: String = createBinary(num, depth: 0)
    guard ret.characters.count < 33 else {
        return "ERROR"
    }
    return ret
}

printBinary(num: 0.252)


//: [Next](@next)
