//
//  1654_CuttingLan.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/08/23.
//  Copyright © 2020 innie. All rights reserved.
// binary search -> 임의의 값을 답이라 가정하여 maxLength를 업데이트 한다.

import Foundation

func cuttingLan(){
    
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    let K = arr[0], N = arr[1]
    var list = [Int]()
    
    (0 ..< K).forEach { _ in
        list.append(Int(readLine()!)!)
    }
    
    var right=list.max()!
    var left=1
    var maxVal=0
    
    while(left<=right){
        let mid = (left+right) / 2
        
        var sum=0
        
        for lanWire in list{
            sum += lanWire / mid
        }
        
        if sum < N {
            right=mid-1
        }else{
            if mid > maxVal{
                maxVal=mid
            }
            left = mid + 1
        }
    }
    
    
    print(maxVal)
}
