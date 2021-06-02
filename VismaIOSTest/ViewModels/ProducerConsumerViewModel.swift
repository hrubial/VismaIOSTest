//
//  ProducerConsumerViewModel.swift
//  VismaIOSTest
//
//  Created by Hector Rubial (Personal) on 1/6/21.
//

import Foundation


class ProducerConsumerViewModel {
    let producerConsumerViewController: ProducerConsumerViewController

    var producer: ProducerClass
    var consumerThread: String?

    var producerConsumerBuffer = ProducerConsumerBuffer<Int>()


    init(producerConsumerViewController: ProducerConsumerViewController) {
        self.producerConsumerViewController = producerConsumerViewController
        producer = ProducerClass(buffer: producerConsumerBuffer)
        NotificationCenter.default.addObserver(self, selector: #selector(refreshProducerUI), name: .producerInternalBufferChangeKey, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(refreshBufferUI), name: .producerConsumerBufferChangeKey, object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}


extension ProducerConsumerViewModel {
    func startProducer() {
        producer.startInternalProducer()
    }

    func stopProducer() {
        producer.stopInternalProducer()
    }
}


extension ProducerConsumerViewModel {
    @objc func refreshProducerUI() {
        let producerBufferString = arrayToString(array: producer.internalBuffer)
        producerConsumerViewController.producerQueueLabel.text = producerBufferString
    }

    @objc func refreshBufferUI() {
        let bufferElements = producerConsumerBuffer.elements as [Int]
        let bufferString = arrayToString(array: bufferElements)
        producerConsumerViewController.bufferQueueLabel.text = bufferString
    }

    /*
    enum ProducerConsumerState {
        case
    }

    func (<#parameters#>) -> <#return type#> {
        <#function body#>
    }*/


    func arrayToString(array: [Int]) -> String {
        var inverseArray = array
        inverseArray.reverse()
        var text = ""
        for item in inverseArray {
            if text.isEmpty {
                text = "\(item)"
            } else {
                text.append(", \(item)")
            }
        }
        text = "[ \(text) ]"
        return text
    }
}
