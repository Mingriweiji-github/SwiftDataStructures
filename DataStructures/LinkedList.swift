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
}
