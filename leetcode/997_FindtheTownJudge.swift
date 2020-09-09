
//
//  997_FindtheTownJudge.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/08/03.
//  Copyright © 2020 innie. All rights reserved.
//

/*
 Graph
 
 Submission Detail:
    Runtime: 852 ms, faster than 80.49% of Swift online submissions for Find the Town Judge.
    Memory Usage: 21.3 MB, less than 95.00% of Swift online submissions for Find the Town Judge.
 */
import Foundation
import XCTest

func findJudge(_ N: Int, _ trust: [[Int]]) -> Int {
    var trusting = Array(repeating:0, count:N+1)
    var trusted = Array(repeating:0,count:N+1)
    
    for citizen in trust{
        guard let trustFrom = citizen.first, let trustTo = citizen.last else { return -1 }
        
        trusting[trustFrom] += 1
        trusted[trustTo] += 1
    }
    
    for candidate in 1..<trusted.count{
        if trusting[candidate] == 0 && trusted[candidate] == N-1{
            return candidate
        }
    }
    
    return -1
}
extension SolutionTests{
    func testfindJudge_case1(){
        let N = 2
        let trust = [[1,2]]
        
        let expected=2
        let actual=findJudge(N,trust)
        
        XCTAssertEqual(expected,actual)
    }
    
    func testfindJudge_case2(){
        let N = 3
        let trust = [[1,3],[2,3],[3,1]]
        
        let expected = -1
        let actual=findJudge(N,trust)
        
        XCTAssertEqual(expected,actual)
    }
}
