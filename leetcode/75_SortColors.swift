//
//  75_SortColors.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/09/13.
//  Copyright © 2020 innie. All rights reserved.
//

import Foundation
import XCTest
class SortColors{
    func sortColors(_ nums: inout [Int]){
        guard nums.count > 1 else { return }
        var left = 0
        var right = nums.count - 1
        
        while (left <= right){
            if nums[left] == 2 {
                nums.remove(at: left)
                nums.append(2)
                
                right -= 1
            }else if nums[left] == 0 && left != 0{
                nums.remove(at: left)
                nums.insert(0, at: 0)
                left+=1
            }else{
                left+=1
            }
            
        }
    }
}
