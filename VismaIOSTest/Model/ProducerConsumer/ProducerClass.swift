//
//  ProducerClass.swift
//  VismaIOSTest
//
//  Created by Hector Rubial (Personal) on 1/6/21.
//

import Foundation

class ProducerClass {
    private var timerInternalProduction: Timer?
    private var timerSenderProduction: Timer?
    var timeInternalInterval = 1.0
    var timeSenderInterval = 1.5
    var targetBuffer: ProducerConsumerBuffer<Int>

    var internalBuffer: [Int] = []

    var internalBufferMaxSize = 10
    var internalBufferIsFull: Bool {
        get {
            internalBuffer.count >= internalBufferMaxSize
        }
    }

    init(buffer: ProducerConsumerBuffer<Int>) {
        self.targetBuffer = buffer
        buffer.notificationCenter.addObserver(
            self,
            selector: #selector(checkBufferStatus),
            name: .producerConsumerBufferStateChangeKey,
            object: nil
        )
        self.startInternalProducer()
        self.startSender()
    }

    deinit {
        stopInternalTimer()
        stopSenderTimer()
        targetBuffer.notificationCenter.removeObserver(self)
    }
}


extension ProducerClass {
    func produceNumber() -> Int {
        Int.random(in: 0..<100)
    }

    @objc func addItemToInternalBuffer() {
        if !internalBufferIsFull {
            internalBuffer.append(produceNumber())
            NotificationCenter.default.post(name: .producerInternalBufferChangeKey, object: nil)
        }

        /*
        if targetBuffer.isFull {
            stopTimer()
        } else {

            let nextNumber = internalBuffer.last ?? produceNumber()
            let success = targetBuffer.enqueue(nextNumber)
            if success {
                if !targetBuffer.isFull {

                }
            }
        }*/
    }


    @objc func sendNextItem() -> Bool {
        var success = false
        if let item = internalBuffer.first {
            success = targetBuffer.enqueue(item)
        }
        if success {
            internalBuffer.removeFirst()
            NotificationCenter.default.post(name: .producerInternalBufferChangeKey, object: nil)
        }
        return success
    }
}


extension ProducerClass {
    @objc func checkBufferStatus() {
        if !targetBuffer.isFull {
            startSender()
        }
    }


    func startInternalProducer() {
        addItemToInternalBuffer()
        initInternalTimer()
    }



    func stopInternalProducer() {
        stopInternalTimer()
    }


    func startSender() {
        let success = sendNextItem()
        if success {
            initSenderTimer()
        }
    }



    func stopSender() {
        stopSenderTimer()
    }

}


extension ProducerClass {
    func initInternalTimer() {
        timerInternalProduction?.invalidate()
        timerInternalProduction = Timer.scheduledTimer(
            timeInterval: timeInternalInterval,
            target: self,
            selector: #selector(addItemToInternalBuffer),
            userInfo: nil,
            repeats: true)
        timerInternalProduction?.tolerance = 0.2 // help to save battery
    }

    func stopInternalTimer() {
        timerInternalProduction?.invalidate()
    }


    func initSenderTimer() {
        timerSenderProduction?.invalidate()
        timerSenderProduction = Timer.scheduledTimer(
            timeInterval: timeSenderInterval,
            target: self,
            selector: #selector(sendNextItem),
            userInfo: nil,
            repeats: true)
        timerSenderProduction?.tolerance = 0.2 // help to save battery
    }

    func stopSenderTimer() {
        timerSenderProduction?.invalidate()
    }
}
