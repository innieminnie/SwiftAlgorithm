//
//  454_4SumII.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/07/23.
//  Copyright © 2020 innie. All rights reserved.
//

import Foundation
import XCTest

func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
    var results=0
    var map: [Int:Int]=[:]
    
    for i in A.indices{
        for j in B.indices{
            let sum=A[i]+B[j]
            map[sum]=(map[sum] ?? 0)+1
        }
    }
    
    for i in C.indices{
        for j in D.indices{
            let complement = -(C[i]+D[j])
            if let complementCount=map[complement]{
                results+=complementCount
            }
        }
    }
    return results
}

// Test Code
extension SolutionTests {
    
    func testfourSumCount_case1() {
        // Given-When-Then (준비-실행-검증)
        
        // Given
        let A = [ 1, 2]
        let B = [-2,-1]
        let C = [-1, 2]
        let D = [ 0, 2]
        
        // When
        let expected = 2
        let actual = fourSumCount(A, B, C, D)
        
        // Then
        XCTAssertEqual(expected, actual)
    }
}
