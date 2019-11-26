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
        queueTest()
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

