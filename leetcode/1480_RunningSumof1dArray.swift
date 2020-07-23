//
//  1480_RunningSumof1dArray.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/07/23.
//  Copyright © 2020 innie. All rights reserved.
//

/*
Array

Time Complexity : O(n) iterating the given array (nums)
Space Complexity : O(n) making result array (res)

Submission Detail:
    Runtime: 20 ms, faster than 84.85% of Swift online submissions for Running Sum of 1d Array.
    Memory Usage: 20.7 MB, less than 100.00% of Swift online submissions for Running Sum of 1d Array.
*/

import Foundation
import XCTest

func runningSum(_ nums: [Int]) -> [Int] {
    var curSum:Int=0
    var res:[Int]=[Int]()
    
    for i in nums{
        curSum+=i
        res.append(curSum)
    }
    return res
}
extension SolutionTests{
    func testrunningSum_case1(){
        let nums=[1,2,3,4]
        let expected=[1,3,6,10]

        let actual=runningSum(nums)

        XCTAssertEqual(expected, actual)
    }


}
