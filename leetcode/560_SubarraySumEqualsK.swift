//
//  560_SubarraySumEqualsK.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/07/24.
//  Copyright © 2020 innie. All rights reserved.
//


/*
 Array, Hash Table
 
 Time Complexity: O(n) looping through array
 Space Complexity: O(n) making preSum dictionary
 
 Submission Detail:
 Runtime: 136 ms, faster than 87.20% of Swift online submissions for Subarray Sum Equals K.
 Memory Usage: 20.8 MB, less than 85.96% of Swift online submissions for Subarray Sum Equals K.
 
 SUM[i, j]를 구해야한다.
 SUM[0, i - 1] & SUM[0, j] 으로 SUM[i, j] 구하기.
 배열 순회하면서, the current sum 계산 and PreSum 정보 HashMap에 저장.
 */

import Foundation
import XCTest

class SubarraySumEqualsK{
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var count=0
        var sum=0
        var preSum: [Int:Int]=[:]
        preSum[0]=1
        
        for num in nums{
            sum+=num
            if let hasSum=preSum[sum-k]{
                count+=hasSum
            }
            preSum[sum] = (preSum[sum] ?? 0)+1 //getOrDefault
        }
        
        return count
    }
}

extension SolutionTests{
    func testsubarraySum_case1(){
        let nums=[1,1,1]
        let k=2
        
        let expected=2
        
        let actual=SubarraySumEqualsK().subarraySum(nums, k)
        
        XCTAssertEqual(expected, actual)
    }
}

