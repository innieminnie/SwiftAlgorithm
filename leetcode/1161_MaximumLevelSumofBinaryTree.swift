//
//  1161_MaximumLevelSumofBinaryTree.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/09/14.
//  Copyright © 2020 innie. All rights reserved.
//

import Foundation

public class TreeNode2 {
    public var val: Int
    public var left: TreeNode2?
    public var right: TreeNode2?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode2?, _ right: TreeNode2?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
class MaximumLevelSumofaBinaryTree{
    func maxLevelSum(_ root: TreeNode2?) -> Int {
        guard let root = root else{
            return -1
        }
        var queue = [TreeNode2]()
        var sum = root.val
        var level = 1
        var res = 1
        queue.append(root)
       
        while !queue.isEmpty{
            level += 1
            var nextLevelNodes = [TreeNode2]()
            
            for parent in queue{
                if let left = parent.left{
                    nextLevelNodes.append(left)
                }
                if let right = parent.right{
                    nextLevelNodes.append(right)
                }
            }
            
            queue = nextLevelNodes
            var localSum = 0
            for node in queue{
                localSum += node.val
            }
            
            if sum < localSum{
                res = level
                sum = localSum
            }
        }
        return res
       }
}
