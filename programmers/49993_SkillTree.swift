//
//  SkillTree.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/09/16.
//  Copyright © 2020 innie. All rights reserved.
//

import Foundation
import XCTest

class SkillTree{
    func skillTree(_ skill:String, _ skill_trees:[String]) -> Int {
        var count = 0
        
        skill_trees.forEach { (skillTree) in
            let filteredList = skillTree.filter{skill.contains($0)}
            if skill.starts(with: filteredList){
                    count+=1
            }
        }
        return count
    }
}
extension SolutionTests{
    func testskillTree_case1(){
        let skill = "CBD"
        let skill_trees = ["BACDE", "CBADF", "AECB", "BDA"]
        let expected = 2
        let actual = SkillTree().skillTree(skill, skill_trees)
        XCTAssertEqual(expected, actual)
    }
}

