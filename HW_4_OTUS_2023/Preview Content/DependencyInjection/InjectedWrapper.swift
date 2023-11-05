//
//  InjectedWrapper.swift
//  HW_4_OTUS_2023
//
//  Created by Филатов Олег Олегович on 05.11.2023.
//

import Foundation

@propertyWrapper
struct InjectedWrapper <T: AnyObject> {
    private var service: T?
    private weak var serviceManager = ServiceLoactor.shared
    
    public var wrappedValue: T? {
        mutating get {
            if service == nil {
                service = serviceManager?.getService()
            }
            return service
        }
        mutating set {
            service = newValue
        }
    }
    
    public var projectedValue: InjectedWrapper<T> {
        get {
            return self
        }
        mutating set {
            self = newValue
        }
    }
}

