//
//  480_SlidingWindowMedian.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/07/23.
//  Copyright © 2020 innie. All rights reserved.
//

import Foundation
import XCTest

func getMedian(_ arr: inout [Int])->Double{
    if arr.count % 2 != 0{
        return Double(arr[arr.count/2])
    }else{
        return Double((Double(arr[arr.count/2])+Double(arr[arr.count/2-1]))/2.0)
    }
}

func binaryRemove(_ num: Int, arr: inout [Int]){
    var left=0
    var right=arr.count-1
    while left<=right{
        let mid=left+(right-left)/2
        if(num>arr[mid]){
            left=mid+1
        }else if num<arr[mid]{
            right=mid-1
        }else{
            left=mid
            break
        }
    }
    arr.remove(at:left)
}

func binaryInsert(_ num: Int, arr: inout [Int]){
    var left=0
    var right=arr.count-1
    while left<=right{
        let mid=left+(right-left)/2
        if num>arr[mid]{
            left=mid+1
        }else if num<arr[mid]{
            right=mid-1
        }else{
            left=mid
            break
        }
    }
    arr.insert(num, at:left)
}

func medianSlidingWindow(_ nums: [Int], _ k: Int) -> [Double] {
    guard nums.count > 0 else{return [] }
    var medians=[Double]()
    var slidingWindow=[Int]()
    
    for i in 0..<nums.count{
        if i<k{
            binaryInsert(nums[i], arr: &slidingWindow)
        }else{
            medians.append(getMedian(&slidingWindow))
            binaryRemove(nums[i-k],arr: &slidingWindow)
            binaryInsert(nums[i],arr: &slidingWindow)
        }
    }
    medians.append(getMedian(&slidingWindow))
    return medians
}

extension SolutionTests{
    func testmedainSlidingWindow_case1() {
        // Given-When-Then (준비-실행-검증)
        
        // Given
        let nums = [1,3,-1,-3,5,3,6,7]
        let k = 3
        
        // When
        let expected:[Double]
        expected = [1,-1,-1,3,5,6]
        let actual = medianSlidingWindow(nums,k)
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
