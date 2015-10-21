//
//  SynchronizedOnType.swift
//  Rx
//
//  Created by Krunoslav Zaher on 10/25/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation

protocol SynchronizedOnType : class, ObserverType, Lock {
    func _synchronized_on(event: RxEvent<E>)
}

extension SynchronizedOnType {
    func synchronizedOn(event: RxEvent<E>) {
        if #available(iOS 8.0, *) {
            lock(); defer { unlock() }
        }
        _synchronized_on(event)
    }
}