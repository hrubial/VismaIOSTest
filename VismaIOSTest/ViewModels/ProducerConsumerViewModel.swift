//
//  ProducerConsumerViewModel.swift
//  VismaIOSTest
//
//  Created by Hector Rubial (Personal) on 1/6/21.
//

import Foundation


class ProducerConsumerViewModel {

    let producerConsumerViewController:ProducerConsumerViewController

    var producerThread:String?
    var consumerThread:String?

    var producerConsumerBuffer = ProducerConsumerBuffer()


    init(producerConsumerViewController: ProducerConsumerViewController) {
        self.producerConsumerViewController = producerConsumerViewController
    }
}


extension ProducerConsumerViewModel {

    enum ProducerConsumerState {
        case
    }

    func startProducer(<#parameters#>) -> <#return type#> {
        <#function body#>
    }
}
