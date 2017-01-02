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

/* 5.3
 양의 정수 x가 입력으로 주어진다고 하자. 이 정수를 이진수로 표현했을 때 1인 비트의 개수가 n이라고 하자. 이진수로
 표현했을 때 1인 비트개수가 n인 다른 정수 중에서 x보다 작은 것 중 가장 큰 정수와, x보다 큰 것중 가장 작은 정수
 를 찾아라
 */

func getNext(n: Int) -> Int {
    var c: Int = n
    var c0: Int = 0
    var c1: Int = 0
    // c0 - > 0 to the right of P
    while c & 1 == 0, c != 0 {
        c0 += 1
        c = (c >> 1)
    }
    // c1 - > 1 to the right of P
    while c & 1 == 1 {
        c1 += 1
        c = (c >> 1)
    }
    let p = c0 + c1
    if c0 + c1 == 31 || c0 + c1 == 0 {
        return -1
    }
    var ret: Int = n
    ret |= (1 << p)
    ret &= ~((1 << p) - 1)
    ret |= ((1 << (c1 - 1)) - 1)
    
    return ret
}

getNext(n: 200) // 1100 1000 -> 1101 0000

func getPrev(n: Int) -> Int {
    var temp: Int = n
    var c0: Int = 0
    var c1: Int = 0
    while (temp & 1) == 1 {
        c1 += 1
        temp = (temp >> 1)
    }
    if temp == 0 {
        return -1
    }
    while (temp & 1) == 0 && (temp != 0) {
        c0 += 1
        temp = (temp >> 1)
    }
    let p = c0 + c1
    var ret: Int = n
    ret = ret & ((~0) << (p + 1))
    ret |= ((1 << (c1 + 1)) - 1) << (c0 - 1)
    
    return ret
}

getPrev(n: 200) // 1100 1000 -> 1100 0100


//: [Next](@next)
