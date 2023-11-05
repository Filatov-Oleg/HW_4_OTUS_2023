//
//  File.swift
//  
//
//  Created by Филатов Олег Олегович on 05.11.2023.
//

import Foundation

public struct CarEntity {
    public let id = UUID()
    public var name: String = ""
    public var colorCar: String = ""
    public var quantityOfPetrol: Double = 0.0
    public var numberCar: String = ""
    public var isRent: Bool = false
}
