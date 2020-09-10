//
//  153_FindMinimuminRotatedSortedArray.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/07/26.
//  Copyright © 2020 innie. All rights reserved.
//

/*
 
 Submission Detail
    Runtime: 16 ms, faster than 98.17% of Swift online submissions for Find Minimum in Rotated Sorted Array.
    Memory Usage: 20.9 MB, less than 93.75% of Swift online submissions for Find Minimum in Rotated Sorted Array.
 */
import Foundation
import XCTest

//ver.1
func findMin(_ nums: [Int])->Int{
    for i in 0..<nums.count-1{
        let first=nums[i]
        let second=nums[i+1]
        
        if(first>second){
            return second
        }
    }
    return nums[0]
}

//ver.2 binary search
func findMin2(_ nums: [Int]) -> Int {
    if nums.count == 0 {
        return 0
    }
    
    var left = 0
    var right = nums.count - 1
    var middle = 0
    
    while left < right {
        middle = (left + right) / 2
        if nums[middle] > nums[right] {
            left = middle + 1
        } else {
            right = middle
        }
    }
    
    return nums[left]
}
extension SolutionTests{
    func testfindMin_case1(){
        let nums=[3,4,5,1,2]
           let expected=1
           
           let actual=findMin(nums)
           
           XCTAssertEqual(expected, actual)
    }
   
}
