//
//  128_LongestConsequtiveSequence.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/09/09.
//  Copyright © 2020 innie. All rights reserved.
//

import Foundation
import XCTest
class LongestConsecutiveSequence {
    func longestConsecutive(_ nums: [Int]) -> Int {
        let numSet = Set(nums)
        var maxLength = 0
        
        for num in nums{
            if !numSet.contains(num-1){
                var currLength = 1
                var temp = num+1
                
                while numSet.contains(temp){
                    currLength+=1
                    temp+=1
                }
                
                maxLength = max(currLength,maxLength)
            }
        }
        return maxLength
    }
}
extension SolutionTests{
    func testlongestConsecutive_case1(){
        let nums = [100,4,200,1,3,2]
        let expected = 4
        
        let actual = LongestConsecutiveSequence().longestConsecutive(nums)
        
        XCTAssertEqual(expected, actual)
    }
}
