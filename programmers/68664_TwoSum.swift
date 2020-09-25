//
//  68664_TwoSum.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/09/16.
//  Copyright © 2020 innie. All rights reserved.
//
import Foundation
import XCTest

class TwoSum{
    func makeTwoSum(_ numbers:[Int]) -> [Int] {
        var sortedNumbers = numbers.sorted()
        var sumSet = [Int]()
        var val = 0
        
        for i in 0..<sortedNumbers.count{
            for j in i+1..<sortedNumbers.count{
                val = sortedNumbers[i]+sortedNumbers[j]
                if sumSet.contains(val){
                   continue
                }
                 sumSet.append(val)
            }
        }
        return sumSet.sorted()
}
   
}
extension SolutionTests{
    func testmakeTwoSum_case1(){
        let numbers = [2,1,3,4,1]
        let expected = [2,3,4,5,6,7]
        let actual = TwoSum().makeTwoSum(numbers)
        XCTAssertEqual(expected,actual)
    }
}
