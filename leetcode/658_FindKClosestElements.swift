//
//  658_FindKClosestElements.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/07/23.
//  Copyright © 2020 innie. All rights reserved.
//

/*
Binary Search & Two Pointers

Time Complexity : O(logn) for binary search (function findX) + O(k) for making array size of k
Space Complexity : O(k) for array size of k

Submission Detail:
    Runtime: 520 ms, faster than 43.90% of Swift online submissions for Find K Closest Elements.
    Memory Usage: 21.7 MB, less than 95.45% of Swift online submissions for Find K Closest Elements.
*/

import Foundation
import XCTest

func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
    let n=arr.count
    let index=findX(arr,x)
    
    var res:[Int]=[]
    var i=index-1
    var j=index
    
    while res.count<k && i>=0 && j<n{
        let diff1=abs(arr[i]-x)
        let diff2=abs(arr[j]-x)
        if(diff2<diff1){
            res.append(arr[j])
            j+=1
        }else{
            res.append(arr[i])
            i-=1
        }
    }
    while res.count < k && i>=0{
        res.append(arr[i])
        i-=1
    }
    while res.count < k && j<n{
        res.append(arr[j])
        j+=1
    }
    return res.sorted()
}

func findX(_ arr: [Int],_ x:Int)->Int{
    var low=0
    var high=arr.count-1
    while high>=low
    {
        let mid=(low+high)/2
        if arr[mid] == x{
            return mid
        }else if arr[mid] < x{
            low=mid+1
        }else{
            high=mid-1
        }
    }
    return low
    
}

//Test Code
extension SolutionTests {
    
    func testfindClosestElements_case1() {
        // Given-When-Then (준비-실행-검증)
        
        // Given
        let arr = [1,2,3,4,5]
        let k = 4
        let x = 3
        
        // When
        let expected = [1,2,3,4]
        let actual = findClosestElements(arr, k, x)
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
