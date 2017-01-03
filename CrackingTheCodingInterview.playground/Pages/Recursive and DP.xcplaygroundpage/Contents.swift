//: [Previous](@previous)

import Foundation

/* 9.1
 n개의 계단을 아이가 오른다. 한 번에 1계단을 오르기도 하고, 2계단이나 3계단씩 오르기도 한다. 계단을 오르는
 데 몇 가지 방법이 있는지 계산하는 메서드를 구현하라.
 */

func countWay(n: Int) -> Int{
    var cache = [Int](repeating: -1, count: n+1)
    func clacWay(_ idx: Int) -> Int {
        if idx < 0 {
            return 0
        }
        if idx == 0 {
            return 1
        }
        if cache[idx] != -1 {
            return cache[idx]
        }
        cache[idx] = clacWay(idx - 1) + clacWay(idx - 2) + clacWay(idx - 3)
        return cache[idx]
    }
    clacWay(n)
    return cache[n]
}

countWay(n: 5)




//: [Next](@next)
