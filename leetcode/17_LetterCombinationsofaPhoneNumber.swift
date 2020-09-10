//
//  17_LetterCombinationsofaPhoneNumber.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/07/26.
//  Copyright © 2020 innie. All rights reserved.
//

/*
 Backtracking, String
 
 
 Submission Detail:
 Runtime: 8 ms, faster than 74.86% of Swift online submissions for Letter Combinations of a Phone Number.
 Memory Usage: 20.9 MB, less than 92.31% of Swift online submissions for Letter Combinations of a Phone Number.
 */
import Foundation
import XCTest


let digitMap: [Character: String] = ["2":"abc", "3":"def", "4":"ghi", "5":"jkl",
                                     "6":"mno", "7":"pqrs", "8":"tuv", "9":"wxyz"]
func letterCombinations(_ digits: String) -> [String] {
    let digits = Array(digits)
    var output = [String]()
    dfs(0, digits, [String](), &output)
    return output
}

private func dfs(_ currentIndex: Int, _ digits: [Character], _ path: [String], _ output: inout [String]) {
    guard currentIndex < digits.count else {
        if !path.isEmpty {
            output.append(path.joined(separator: ""))
        }
        return
    }
    for letter in digitMap[digits[currentIndex]]! {
        let newPath = path + [String(letter)]
        dfs(currentIndex + 1, digits, newPath, &output)
    }
}

extension SolutionTests{
    func testletterCombinations_case1(){
        let digits="23"
        let expected=["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]
        
        let actual=letterCombinations(digits)
        
        XCTAssertEqual(expected, actual)
    }
}
