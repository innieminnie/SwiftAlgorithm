//
//  64_MinimumPathSum.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/08/03.
//  Copyright © 2020 innie. All rights reserved.
//

/*
 
 Submission Details:
    Runtime: 60 ms, faster than 97.66% of Swift online submissions for Minimum Path Sum.
    Memory Usage: 21 MB, less than 83.33% of Swift online submissions for Minimum Path Sum.
 */

import Foundation
import XCTest

func minPathSum(_ grid: [[Int]]) -> Int {
    var dpGrid=grid
    
    let height=grid.count
    let width=grid[0].count
    
    for i in 1..<width{
        dpGrid[0][i]=dpGrid[0][i-1]+dpGrid[0][i]
    }
    for j in 1..<height{
        dpGrid[j][0]=dpGrid[j-1][0]+dpGrid[j][0]
    }
    
    for i in 1..<height{
        for j in 1..<width{
            dpGrid[i][j]=min(dpGrid[i-1][j],dpGrid[i][j-1])+grid[i][j]
            
        }
    }
    
    return dpGrid[height-1][width-1]
}
extension SolutionTests{
    func testminPathSum_case1(){
        let grid = [[1,3,1],[1,5,1],[4,2,1]]
        let expected=7
        
        let actual=minPathSum(grid)
        
        XCTAssertEqual(expected,actual)
    }
    
    func testminPathSum_case2(){
        let grid=[[1,2,5],[3,2,1]]
        
        let expected = 6
        let actual=minPathSum(grid)
        
        XCTAssertEqual(expected,actual)
    }
}
