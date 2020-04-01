//
//  Obvservable.swift
//  NikeCodingChallenge
//
//  Created by Susan Salas on 3/31/20.
//  Copyright © 2020 Susan Salas. All rights reserved.
//

import Foundation

public final class Observable<T>: ObservableProtocol {
    func subscribe(observer: AnyObject, block: @escaping (T, T) -> ()) {
        let entry: ObserversEntry = (observer: observer, block: block)
        observers.append(entry)
    }
    
    
    
    private var observers: Array<ObserversEntry>

    typealias ObserverBlock = (_ newValue: T, _ oldValue: T) -> ()
    typealias ObserversEntry = (observer: AnyObject, block: ObserverBlock)
    
    var value: T {
        didSet {
            observers.forEach { (entry: ObserversEntry) in
                // oldValue is an implicit parameter to didSet in Swift!
                let (_, block) = entry
                block(value, oldValue)
            }
        }
    }
    
    init(_ value: T) {
        self.value = value
        observers = []
    }

    func unsubscribe(observer: AnyObject) {
        let filtered = observers.filter { entry in
            let (owner, _) = entry
            return owner !== observer
        }

        observers = filtered
    }
}


protocol ObservableProtocol {
    associatedtype T
    var value: T { get set }
    func subscribe(observer: AnyObject, block: @escaping (_ newValue: T, _ oldValue: T) -> ())
    func unsubscribe(observer: AnyObject)
}

