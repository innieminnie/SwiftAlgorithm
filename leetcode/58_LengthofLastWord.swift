//
//  58_LengthofLastWord.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/09/17.
//  Copyright © 2020 innie. All rights reserved.
//

import Foundation
import XCTest

class LengthofLastWord{
    func lengthOfLastWord(_ s: String) -> Int {
        let mapped = s.split(separator: " ").map{($0.count)}
        guard (mapped.count > 0) else{ return 0}
        let result = mapped[mapped.index(before: mapped.endIndex)]
        return result
        
    }
}

extension SolutionTests{
    func testLengthofLastWord(){
        let expected = 5
        let actual = LengthofLastWord().lengthOfLastWord("hello world")
        XCTAssertEqual(expected, actual)
    }
    func testLengthofLastWor_case2(){
        let expected = 0
        let actual = LengthofLastWord().lengthOfLastWord("")
        XCTAssertEqual(expected, actual)
    }
    func testLengthofLastWord_case(){
        let expected = 0
        let actual = LengthofLastWord().lengthOfLastWord(" ")
        XCTAssertEqual(expected, actual)
    }
    func testLengthofLastWord_case4(){
        let expected = 1
        let actual = LengthofLastWord().lengthOfLastWord("a ")
        XCTAssertEqual(expected, actual)
    }
}
