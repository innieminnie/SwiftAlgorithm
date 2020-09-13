//
//  179_LargestNumber.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/09/13.
//  Copyright © 2020 innie. All rights reserved.
//

//Submission Detail:
//    Runtime: 8 ms, faster than 100.00% of Swift online submissions for Largest Number.
//    Memory Usage: 21.3 MB, less than 20.00% of Swift online submissions for Largest Number.

import Foundation
import XCTest

class LargestNumber{
      func standardSort(_ A:String,_ B:String)->Bool{
         if (A+B > B+A) {return true}
         return false
     }
     
     func largestNumber(_ nums: [Int])->String{
         var strNums = nums.map{String($0)}
         strNums.sort(by: standardSort)
        let answer = strNums.map{$0}.joined()
        return answer.first == "0" ? "0" : answer
     }
}
extension SolutionTests{
    func testlargestNumber_case1(){
        let nums = [10,2]
        let expected = "210"
        
        let actual = LargestNumber().largestNumber(nums)
        XCTAssertEqual(expected,actual)
    }
    func testlargestNumber_case2(){
        let nums = [0,0]
        let expected = "0"
        
        let actual = LargestNumber().largestNumber(nums)
        XCTAssertEqual(expected,actual)
    }
    
}
