//
//  ProducerConsumerViewController.swift
//  VismaIOSTest
//
//  Created by Hector Rubial (Personal) on 1/6/21.
//

import UIKit

class ProducerConsumerViewController: UIViewController {
    var producerConsumerViewModel: ProducerConsumerViewModel?

    @IBOutlet weak var producerFlagView: UIView!
    @IBOutlet weak var producerQueueLabel: UILabel!

    @IBOutlet weak var bufferQueueLabel: UILabel!

    @IBOutlet weak var consumerFlagView: UIView!
    @IBOutlet weak var consumerQueueLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
        producerConsumerViewModel = ProducerConsumerViewModel(producerConsumerViewController: self)
    }

    func prepareUI() {
        producerFlagView.layer.cornerRadius = 16
        consumerFlagView.layer.cornerRadius = 16
    }


    @IBAction func startProducerAction(_ sender: Any) {
        producerConsumerViewModel?.startProducer()
    }

    @IBAction func stopProducerAction(_ sender: Any) {
        producerConsumerViewModel?.stopProducer()
    }


    @IBAction func startConsumerAction(_ sender: Any) {
        // producerConsumerViewModel?.startProducer()
    }

    @IBAction func stopConsumerAction(_ sender: Any) {
        // producerConsumerViewModel?.stopProducer()
    }
}
