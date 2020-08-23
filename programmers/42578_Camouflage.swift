//
//  42578_Camouflage.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/08/02.
//  Copyright © 2020 innie. All rights reserved.
//

import Foundation
import XCTest

func camouflage(_ clothes:[[String]]) -> Int {
    var classification=[String:Int]()
    
    for cloth in clothes{
        classification[cloth[1]]=(classification[cloth[1]] ?? 0) + 1
    }
    
    var combinationCount=1
    
    for numbers in classification.values{
        combinationCount*=(numbers+1)
    }
    
    return combinationCount-1
}

extension SolutionTests{
    func testcamouflage_case1(){
        let clothes=[["yellow_hat", "headgear"], ["blue_sunglasses"
            , "eyewear"], ["green_turban", "headgear"]]
        
        let expected=5
        
        let actual=camouflage(clothes)
        
        XCTAssertEqual(expected, actual)
    }
    
    func testcamouflage_case2(){
        let clothes=[["crow_mask","face"], ["blue_sunglasses","face"], ["smoky_makeup","face"]]
        
        let expected=3
        
        let actual=camouflage(clothes)
        
        XCTAssertEqual(expected, actual)
    }

}
