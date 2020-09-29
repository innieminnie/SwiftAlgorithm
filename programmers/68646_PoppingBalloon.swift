//
//  68646_PoppingBalloon.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/09/26.
//  Copyright © 2020 innie. All rights reserved.
//

import Foundation
import XCTest

class PoppingBalloon{
    func popBalloon(_ a:[Int]) -> Int {
        var answer = 0
        
        var left = Int.max
        var right = Int.max
        
        for i in 0..<a.count{
            if a[i] < left{
                answer+=1
                left = a[i]
            }
            if a[a.count-1-i] < right{
                answer+=1
                right = a[a.count-1-i]
            }
            if left == right{
                break
            }
        }
        return answer+(left==right ? -1 : 0)
    }
}
extension SolutionTests{
    func testpopBalloon_case1(){
        let a = [-16,27,65,-2,58,-92,-71,-68,-61,-33]
        let expected = 6
        
        let actual = PoppingBalloon().popBalloon(a)
        
        XCTAssertEqual(expected, actual)
    }
}
