//
//  Trees.swift
//  DataStructures
//
//  Created by tianjiang_mac on 2019/11/25.
//  Copyright © 2019 KM. All rights reserved.
//

import UIKit
import Foundation

public  class TreeNode<T> {
    var value: T
    var children: [TreeNode] = []
    public init(_ value: T) {
        self.value = value
    }
    
    public func add(_ child: TreeNode) {
        children.append(child)
    }
    
    func test() {
//           let beverages = TreeNode("Beverages")
//           let hot = TreeNode("hot")
//           let cold = TreeNode("cold")
        
    }
}
/// 深度优先遍历
extension TreeNode {
    public func forEachDepthFirst(visit: (TreeNode) -> Void) {
        visit(self)
        children.forEach {
            $0.forEachDepthFirst(visit: visit)
        }
    }
}
///层序遍历
extension TreeNode {
    func forEachLevelOrder(visit: (TreeNode) -> Void) {
        visit(self)
        
    }
}

