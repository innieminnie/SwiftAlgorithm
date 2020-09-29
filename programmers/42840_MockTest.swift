//
//  42840_MockTest.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/09/27.
//  Copyright © 2020 innie. All rights reserved.
//

import Foundation
import XCTest

class MockTest{
    func mockTest(_ answers:[Int]) -> [Int] {
        var result = [Int]()
        var score = Array(repeating: 0, count: 3)
        
        let firstStudent = [1,2,3,4,5]
        let secondStudent = [2,1,2,3,2,4,2,5]
        let thirdStudent = [3,3,1,1,2,2,4,4,5,5]
        
        for idx in 0..<answers.count{
            let answer = answers[idx]
            
            if answer == firstStudent[idx % 5]{
                score[0]+=1
            }
            if answer == secondStudent[idx % 8]{
                score[1]+=1
            }
            if answer == thirdStudent[idx % 10]{
                score[2]+=1
            }
        }
        
        var sortedScore = score.sorted(by: >)
        
        let max = sortedScore.first!
        
        for (idx,val) in score.enumerated(){
            if val == max{
                result.append(idx+1)
            }
        }
        
        return result
    }
}
extension SolutionTests{
    func testmockTest_case1(){
        let answers = [1,3,2,4,2]
        let expected = [1,2,3]
        
        let actual = MockTest().mockTest(answers)
        
        XCTAssertEqual(expected, actual)
    }
}
