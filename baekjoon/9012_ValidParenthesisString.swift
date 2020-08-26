//
//  9012_ValidParenthesisString.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/08/26.
//  Copyright © 2020 innie. All rights reserved.
//  Stack

import Foundation


func checkValidParenthesis(){
    let caseNum=Int(readLine()!)!
    var stack = [Character]()

    for _ in 0..<caseNum{
        var valid=true
        stack.removeAll()
        let testCase = readLine()!
        
        for i in testCase{
            if i == "("{
                stack.append(i)
            }else{
                if stack.isEmpty{
                   valid=false
                }else{
                    stack.removeLast()
                }
            }
        }
        
        if stack.isEmpty && valid  {
            print("YES")
        }else{
            print("NO")
        }
    }
}

