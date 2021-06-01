//
//  ProducerClass.swift
//  VismaIOSTest
//
//  Created by Hector Rubial (Personal) on 1/6/21.
//

import Foundation

class ProducerClass {
    private var timer: Timer?
    var timeInterval = 1.0
    var buffer:ProducerConsumerBuffer
    

    init(buffer:ProducerConsumerBuffer) {
        self.buffer = buffer
        buffer.
    }

    deinit {
        stopTimer()
    }

}


extension ProducerClass {


    var periodicServiceCallHandler: PeriodicServiceCallHandler?

    func initTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(
            timeInterval: timeInterval,
            target: self,
            selector: #selector(sendRequest),
            userInfo: nil,
            repeats: true)
        timer?.tolerance = 0.2 // help to save battery
    }

    func stopTimer() {
        timer?.invalidate()
    }

    @objc func sendRequest() {
        if networkMonitor.isReachable {
            DispatchQueue.main.async {
                self.periodicServiceCallHandler?.sendRequest()
            }
        }
    }


}
