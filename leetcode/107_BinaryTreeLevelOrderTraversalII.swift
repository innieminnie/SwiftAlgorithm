//
//  107_BinaryTreeLevelOrderTraversalII.swift
//  SolutionTests
//
//  Created by 강인희 on 2020/10/16.
//  Copyright © 2020 innie. All rights reserved.
//

import Foundation
import XCTest


//func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
//    guard root != nil else { return []}
//    var answer = [[Int]]()
//    var queue = [(TreeNode,Int)]()
//
//
//    queue.append((root!,0))
//
//    while(!queue.isEmpty){
//        var queueSize = queue.count
//        var queue2 = [Int]()
//
//        for i in 0..<queueSize{
//            var firstItem = queue.removeFirst()
//            var node = firstItem.0
//            var level = firstItem.1
//
//            if node.left != nil {
//                queue.append((node.left!,level+1))
//            }
//            if node.right != nil {
//                queue.append((node.right!,level+1))
//            }
//            queue2.append(node.val)
//        }
//
//        answer.insert(queue2, at: 0)
//    }
//    return answer
//}
//extension SolutionTests{
//
//}
