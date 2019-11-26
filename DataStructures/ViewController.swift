//
//  ViewController.swift
//  DataStructures
//
//  Created by tianjiang_mac on 2019/11/25.
//  Copyright © 2019 KM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        nodeTest()
//        linkedListTest()
        linkedListTestRemove()
//        queueTest()
    }
    func nodeTest() {
        let node1 = Node(value: 1)
        let node2 = Node(value: 2)
        let node3 = Node(value: 3)
        node1.next = node2
        node2.next = node3
        print("node = \(node1)")
    }
    func linkedListTest() {
        var list = LinkedList<Int>()
        list.push(1)
        list.push(2)
        list.push(3)
        print("before---\(list)")
        let popedValue = list.pop()
        print("poped value:" + String(describing: popedValue))
        print("after pop list:\(list)")
    }
    func linkedListTestRemove() {
        var list = LinkedList<Int>()
        list.push(1)
        list.push(2)
        list.push(3)
        print("v before remove last: \(list)")
        let removeLastValue = list.removeLast()
        print("removed value: \(String(describing: removeLastValue))")
        print("v after remove last:\(list)")
    }
    func queueTest() {
        var queue = QueueArray<String>()
        queue.enqueue("ray")
        queue.enqueue("Brain")
        queue.enqueue("Eric")
        print("enqueue-\(queue.array)")
        queue.dequeue()
        print("dequeue-\(queue.array)")
//        queue.peek
    }
    

}

