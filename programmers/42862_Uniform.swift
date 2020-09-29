//
//  42862_Uniform.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/09/28.
//  Copyright © 2020 innie. All rights reserved.
//

import Foundation
class Uniform{
    func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
        var statusArray = Array(repeating: 0, count: n)
        
        for i in lost{
            statusArray[i-1] = -1
        }
        for j in reserve{
            statusArray[j-1] += 1
        }
        
        for (idx,value) in statusArray.enumerated(){
            if value == -1{
                if (idx > 0 && statusArray[idx-1] == 1){
                    statusArray[idx-1]-=1
                    statusArray[idx]+=1
                }else if ((idx < statusArray.count-1) && statusArray[idx+1] == 1){
                    statusArray[idx+1]-=1
                    statusArray[idx]+=1
                }
            }
        }
        return statusArray.filter{$0>=0}.count
    }
}
