//
//  678_ValidParenthesisString.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/08/20.
//  Copyright © 2020 innie. All rights reserved.
//
/*
 String
 
 Time Complexity : O(n)
 Space Complexity : O(n)

 Submission Detail:
    Runtime: 8 ms, faster than 54.76% of Swift online submissions for Valid Parenthesis String.
    Memory Usage: 20.8 MB, less than 52.38% of Swift online submissions for Valid Parenthesis String.
 
 헤멘 부분 : 각 character의 index를 고려하지 않았음.
          *를 count로 세서 비교하니까 index 순서가 맞지 않는 경우 보장되지 않음.
 
 */

import Foundation
import XCTest

class ValidParenthesisString{
    func checkValidString(_ s: String)->Bool{
           var OpenParenthesisStack=[Int]()
           var StarStack=[Int]()
           
        var idx=0
        for value in s{
               if value=="("{
                   OpenParenthesisStack.append(idx)
               }else if value=="*"{
                   StarStack.append(idx)
               }else{
                   if !OpenParenthesisStack.isEmpty{
                      OpenParenthesisStack.removeLast()
                   }else{
                       if !StarStack.isEmpty{
                           StarStack.removeLast()
                       }else{
                           return false
                       }
                   }
                   
               }
            idx+=1
           }
        
        
        if StarStack.count<OpenParenthesisStack.count{
            return false
        }
           
           while !OpenParenthesisStack.isEmpty {
               if !StarStack.isEmpty, OpenParenthesisStack.last! < StarStack.last! {
                   OpenParenthesisStack.removeLast()
                   StarStack.removeLast()
               } else { break }
           }

           return OpenParenthesisStack.isEmpty
    }
}
extension SolutionTests{
    func testcheckValidString_case1(){
        let s="(*))"
       
        let expected=true
        
        let actual=ValidParenthesisString().checkValidString(s)
        
        XCTAssertEqual(expected, actual)
    }
}

