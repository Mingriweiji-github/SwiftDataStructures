//
//  LinkedList.swift
//  DataStructures
//
//  Created by tianjiang_mac on 2019/11/26.
//  Copyright © 2019 KM. All rights reserved.
//

import Foundation

public struct LinkedList<Value> {
    public var head: Node<Value>?
    public var tail: Node<Value>?
    public init() { }
    public var isEmpty: Bool {
        return head == nil
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "head is nil"
        }
        return String(describing: head)
    }
}

extension LinkedList {
    ///push:链表最前面插入
    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    ///append:链表最后面插入
    public mutating func append(_ value: Value) {
        //1
        guard !isEmpty else {
            push(value)
            return
        }
        //2
        tail?.next = Node(value: value)
        //3
        tail = tail?.next
    }
    //insert: 插入
    //1、找到节点Node
    //2、在该节点后面插入新的节点。
    public func node(at index: Int) -> Node<Value>?{
        //1
        var currentNode = head
        var currentIndex = 0
        //2
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        //3
        return currentNode
    }
    
    @discardableResult
    public mutating func insert(_ value: Value, after node: Node<Value>)
        -> Node<Value>? {
            //4
            guard tail !== node else {
                append(value)
                return tail!
            }
            //5
            node.next = Node(value: value, next: node.next)
            return node.next!
    }
    
    ///pop: 删除链表第一个元素
    @discardableResult
    public mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    ///removeLast: 删除链表最后一个元素
    @discardableResult
    public mutating func removeLast() -> Value? {
        ///1.非空链表判断
        guard let head = head  else {
            return nil
        }
        //2.判断元素个数是否唯一
        guard head.next == nil else {
            return pop()
        }
        ///3、遍历 直到最后一个元素 current.next = nil
        var prev = head
        var current = head
        while current.next != nil {
            prev = current
            current = current.next!
        }
        ///4、既然current是最后一个元素，可以使用prev.next 来断开引用？最后更新尾部节点
        prev.next = nil
        tail = prev
        return current.value
    }
    @discardableResult
    public mutating func remove(after node: Node<Value>) -> Value? {
        defer {
            if node.next == nil {
                self.tail = node
            }
        }
        node.next = node.next?.next
        return node.next?.value
    }
}
extension LinkedList: Collection {
    public func index(after i: LinkedList<Value>.Index) -> LinkedList<Value>.Index {
        return Index(node: i.node?.next)
    }
//    public subscript(position: LinkedList<Value>.Index) -> Slice<LinkedList<Value>> {
//        _read {
//            return position.node!.value
//        }
//    }
    public subscript(position: LinkedList<Value>.Index) -> Value{
        return position.node!.value
    }
    public var startIndex: LinkedList<Value>.Index {
            return Index(node: head)
    }
    public var endIndex: LinkedList<Value>.Index {
        return Index(node: tail?.next)
    }    
    public struct Index: Comparable {
        
            public var node: Node<Value>?
        
            static public func == (lhs: LinkedList<Value>.Index, rhs: LinkedList<Value>.Index) -> Bool {
                switch (lhs.node, rhs.node) {
                case let (left?, right?):
                    return left.next === right.next
                case (nil, nil):
                    return true
                default:
                   return false
            }
        }
       static  public func <(lhs: LinkedList<Value>.Index, rhs: LinkedList<Value>.Index) -> Bool {
            guard lhs != rhs else {
                return false
            }
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains{ $0 === rhs.node }
        }
        
        
    }
}
