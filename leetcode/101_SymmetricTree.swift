//
//  101_SymmetricTree.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/10/16.
//  Copyright © 2020 innie. All rights reserved.
//

import Foundation

//func isSymmetric(_ root: TreeNode?) -> Bool {
//    guard let root = root else {
//        return true
//    }
//
//    return dfs(root.left, root.right)
//}
//
//func dfs(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
//    guard let leftNode = left, let rightNode = right else {
//        return left === right // children of leaves are always true
//    }
//
//    if leftNode.val != rightNode.val { // if the structure doesn't match
//        return false
//    }
//
//    return dfs(leftNode.left, rightNode.right) && dfs(leftNode.right, rightNode.left)
//}
