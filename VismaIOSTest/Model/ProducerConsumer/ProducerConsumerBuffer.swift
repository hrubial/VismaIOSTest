//
//  ProducerConsumerBuffer.swift
//  VismaIOSTest
//
//  Created by Hector Rubial (Personal) on 1/6/21.
//

import Foundation


struct ProducerConsumerBuffer<T> {
    var notificationCenter = NotificationCenter.default
    private var elements: [T] = []
    var maxSize = 10
    var lock:Bool = false
    var isFull:Bool = false {
        didSet{
            notificationCenter.post(name: .producerConsumerBufferStateChangeKey, object: nil)
        }
    }
    var isEmpty:Bool = false {
        didSet{
            notificationCenter.post(name: .producerConsumerBufferStateChangeKey, object: nil)
        }
    }

    mutating func enqueue(_ value: T) -> Bool {
        var success = true
        if !lock {
            lock = true
            if isFull {
                success = false
            } else {
                elements.append(value)
                isFull = (size >= maxSize)
            }
            lock = false
        } else {
            success = false
        }
        return success
    }

    mutating func dequeue() -> T? {
        if !lock {
            lock = true
            guard !elements.isEmpty else {
                return nil
            }
            let returnElement =  elements.removeFirst()
            isEmpty = elements.isEmpty
            lock = false
            return returnElement
        }
        return nil

    }

    var head: T? {
        return elements.first
    }

    var tail: T? {
        return elements.last
    }

    var size:Int {
        get {
            elements.count
        }
    }
}
