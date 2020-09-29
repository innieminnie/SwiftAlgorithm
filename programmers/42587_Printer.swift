//
//  42587_Printer.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/09/26.
//  Copyright © 2020 innie. All rights reserved.
//

import Foundation
import XCTest

class Printer{
    func printOrder(_ priorities:[Int], _ location:Int) -> Int {
        var res = 0
        
        var queue = [(Int,Int)]()
        var priorityQueue = priorities.sorted(by:>)
        
        priorities.enumerated().forEach { (index, property) in
            queue.append((index, property))
        }
        
        while !queue.isEmpty {
                if queue.first!.1 == priorityQueue.first! {
                    if queue.first!.0  == location {
                        return res + 1
                    }
                    
                    res += 1
                    queue.removeFirst()
                    priorityQueue.removeFirst()
                } else {
                    queue.append(queue.removeFirst())
                }
            }
        return res
    }
}
extension SolutionTests{
    func testprintOrder_case1(){
        let priorities = [2, 1, 3, 2]
        let location = 2
        
        let expected = 1
        let actual = Printer().printOrder(priorities, location)
        
        XCTAssertEqual(expected, actual)
    }
}
