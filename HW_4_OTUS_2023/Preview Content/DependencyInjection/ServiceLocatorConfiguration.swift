//
//  ServiceLocatorConfiguration.swift
//  HW_4_OTUS_2023
//
//  Created by Филатов Олег Олегович on 05.11.2023.
//

import Foundation
import NetwotkService

public final class ServiceLocatorConfiguration {

    static let shared = ServiceLocatorConfiguration()

    func createServices() {
        ServiceLoactor.shared.addService(NetwotkService())
//        ServiceLoactor.shared.addService(UserDefaultService())
    }
}
