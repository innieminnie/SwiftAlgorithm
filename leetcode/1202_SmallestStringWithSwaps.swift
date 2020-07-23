//
//  1202_SmallestStringWithSwaps.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/07/23.
//  Copyright © 2020 innie. All rights reserved.
//

import Foundation
import XCTest

var parent=[Int]()
var rank=[Int]()

func smallestStringWithSwaps(_ s: String, _ pairs: [[Int]]) -> String {
    var chars=[Int: [Character]]()
    var indexes=[Int:[Int]]()
    let array=Array(s)
    var result=array
    for i in 0..<array.count{
        parent.append(i)
        rank.append(1)
    }
    
    for i in pairs{
        union(i[0],i[1])
    }
    
    for i in 0..<array.count{
        let index=find(i)
        chars[index,default: [Character]()].append(array[i])
        indexes[index,default: [Int]()].append(i)
    }
    
    for (key,value) in chars{
        let charsArray=value.sorted()
        let indexArray=indexes[key] ?? []
        for i in 0..<charsArray.count{
            result[indexArray[i]]=charsArray[i]
        }
    }
    
    return String(result)
}
func find(_ value: Int)-> Int{
    if parent[value]==value{
        return value
    }
    
    parent[value]=find(parent[value])
    return parent[value]
}
func union(_ first: Int, _ second: Int){
    let first=find(first)
    let second=find(second)
    
    if(first != second){
        if(rank[first]<rank[second]){
            parent[first]=parent[second]
        }else{
            parent[second]=parent[first]
            rank[first]+=1
        }
    }
}

//Test Case
extension SolutionTests{
    func testsmallestStringWithSwaps(){
        //Given
        let s="dcab"
        let pairs=[[0,3],[1,2]]
        
        let expected="bacd"
        
        //When
        let actual=smallestStringWithSwaps(s, pairs)
        
        //Then
        XCTAssertEqual(expected, actual)
    }
}
