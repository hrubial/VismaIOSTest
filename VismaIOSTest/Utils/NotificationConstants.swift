//
//  NotificationConstants.swift
//  VismaIOSTest
//
//  Created by Hector Rubial (Personal) on 1/6/21.
//

import Foundation

extension Notification.Name {
    static let userUpdatedKey = NSNotification.Name("VismaIOSTest.DataManager.userUpdated")
    static let producerConsumerBufferStateChangeKey = NSNotification.Name("VismaIOSTest.ProducerConsumerBuffer.bufferStateChange")
    static let producerConsumerBufferChangeKey = NSNotification.Name("VismaIOSTest.ProducerConsumerBuffer.bufferChange")
    static let producerInternalBufferChangeKey = NSNotification.Name("VismaIOSTest.ProducerInternalBuffer.bufferChange")
}
