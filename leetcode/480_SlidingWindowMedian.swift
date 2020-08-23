//
//  480_SlidingWindowMedian.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/07/23.
//  Copyright © 2020 innie. All rights reserved.
//
/*
 Submission Detail:
    Runtime: 188 ms, faster than 100.00% of Swift online submissions for Sliding Window Median.
    Memory Usage: 21.6 MB, less than 90.91% of Swift online submissions for Sliding Window Median.
 
 Time Complexity : O(nlogn) for binarysearching elements in given array
 Space Complexity : O(k) for sliding window
 
 헤멘 부분 : insertion과 removal 할 위치찾기를 같은 방식의 binary search를 이용한다는 점. 최대 최소가 아닌 중간값을 찾아야한다.
 */

import Foundation
import XCTest

class SlidingWindowMedian{
    
    func getMedian(_ arr: inout [Int])->Double{
        if arr.count % 2 != 0{
            return Double(arr[arr.count/2])
        }else{
            return Double((Double(arr[arr.count/2])+Double(arr[arr.count/2-1]))/2.0)
        }
    }
    func binarySearch(_ num:Int, _ arr:inout[Int])->Int{
        var left=0
        var right=arr.count-1
        
        while left<=right{
            let mid=left + (right - left) / 2
            if num > arr[mid]{
                left = mid + 1
            }else if num < arr[mid]{
                right=mid-1
            }else{
                left=mid
                break
            }
        }
        return left
    }
    
    func medianSlidingWindow(_ nums: [Int], _ k: Int) -> [Double] {
        guard nums.count > 0 else{return [] }
        var medians=[Double]()
        var slidingWindow=[Int]()
        
        for i in 0..<nums.count{
            if i<k{
                let idx = binarySearch(nums[i], &slidingWindow)
                slidingWindow.insert(nums[i], at: idx)
            }else{
                medians.append(getMedian(&slidingWindow))
                let removeIdx = binarySearch(nums[i-k], &slidingWindow)
                slidingWindow.remove(at: removeIdx)
                let insertIdx = binarySearch(nums[i], &slidingWindow)
                slidingWindow.insert(nums[i], at: insertIdx)
            }
        }
        medians.append(getMedian(&slidingWindow))
        return medians
    }
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
        let actual = SlidingWindowMedian().medianSlidingWindow(nums,k)
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
