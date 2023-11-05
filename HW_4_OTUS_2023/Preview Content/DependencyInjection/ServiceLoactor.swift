//
//  ServiceLoactor.swift
//  HW_4_OTUS_2023
//
//  Created by Филатов Олег Олегович on 05.11.2023.
//

import Foundation

final class ServiceLoactor {
    
    public static let shared = ServiceLoactor()

    private lazy var services: Dictionary<String, Any> = [:]
    
    private func typeName(_ some: Any) -> String {
        return (some is Any.Type) ? "\(some)" : "\(type(of: some))"
    }

    func addService<T>(_ service: T) {
        let key = typeName(T.self)
        services[key] = service
        print("Service added: \(key) / \(typeName(service))")
    }

    func getService<T>() -> T? {
        let key = typeName(T.self)
        return services[key] as? T
    }
    
}
