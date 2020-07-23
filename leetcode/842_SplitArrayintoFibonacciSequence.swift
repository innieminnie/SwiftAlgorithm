//
//  842_SplitArrayintoFibonacciSequence.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/07/23.
//  Copyright © 2020 innie. All rights reserved.
//

import Foundation
import XCTest

fileprivate var res=[Int]()
fileprivate var maxVal=Int(pow(2.0,31.0)-1)
fileprivate var found=false

func splitIntoFibonacci(_ S: String) -> [Int] {
    guard S.count>=3 else{
        return [Int]()
    }
    
    let S = S.map{Int(String($0))!}
    
    findSequence(S)
    return found ? res : [Int]()
}

func findSequence(_ S: [Int], _ from: Int=0){
    if from>=S.count && res.count >= 3{
        found=true
        return
    }
    
    var current=0
    for i in from..<S.count{
        current *= 10
        current += S[i]
        guard current < maxVal else{
            return
        }
        
        if i-from>=1 && current < 10 {
            return
        }
        
        if isFibSeq(current){
            findSequence(S,i+1)
            if found{
                return
            }
            res.remove(at: res.count-1)
        }
    }
}

func isFibSeq(_ num: Int)->Bool{
    let count = res.count
    if count<2{
        res.append(num)
        return true
    }
    
    if res[count-1] + res[count-2]==num{
        res.append(num)
        return true
    }
    
    return false
}
//TestCode
extension SolutionTests{
    func testsplitInfoFibonacci(){
        //Given
        let S = "123456579"
        let expected=[123,456,579]
        
        //When
        let actual=splitIntoFibonacci(S)
        
        //Then
        XCTAssertEqual(expected, actual)
    }
}
