//
//  42586_FunctionDevelop.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/09/23.
//  Copyright © 2020 innie. All rights reserved.
//

import Foundation
import XCTest

class FunctionDevelop{
    func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
            var queue = [Int]()
            var res = [Int]()

            var left = 0
            var right = 0
            var count = 0

            for (idx,progress) in progresses.enumerated(){
                let day = Int(ceil(Double((100-progress)) / Double(speeds[idx])))
                queue.append(day)

                if queue[left] >= queue[right]{
                    count += 1
                }else{
                    res.append(count)
                    count = 1
                    left = right
                }

                right += 1
            }
            res.append(count)
            return res
        }
}
    
    extension SolutionTests{
        func testfunctionDevelop(){
            let progresses = [95, 90, 99, 99, 80, 99]
            let speeds = [1,1,1,1,1,1]
            let expected = [1,3,2]
            
            let actual = FunctionDevelop().solution(progresses, speeds)
            
            XCTAssertEqual(expected, actual)
        }
        
    }

