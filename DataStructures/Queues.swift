//
//  Queues.swift
//  DataStructures
//
//  Created by tianjiang_mac on 2019/11/25.
//  Copyright © 2019 KM. All rights reserved.
//

import Foundation

public protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }    
}
// MARK: - 数组队列
public struct QueueArray<T>: Queue {
   
     var array: [T] = []
    public init() {}
    
    public typealias Element = T
    public var isEmpty: Bool {
        return array.isEmpty
    }

    public mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
       
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
    public var peek: T? {
        print("peek-\(array)")
        return array.first
    }
}

extension QueueArray: CustomStringConvertible {
    public var description: String {
        return String(describing: array)
    }
}

// MARK: - 双向链表
//public class QueueLinkedList<T>: Queue {
//    public func enqueue(_ element: T) -> Bool {
//        
//    }
//    
//    public func dequeue() -> T? {
//        
//    }
//    
//    public var isEmpty: Bool
//    
//    public var peek: T?
//    
//    public typealias Element = T
//    
////    private var list: Doubl
//}
