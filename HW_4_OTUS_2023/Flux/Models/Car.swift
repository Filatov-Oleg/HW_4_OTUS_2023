//
//  CarModel.swift
//  HW_4_OTUS_2023
//
//  Created by Филатов Олег Олегович on 05.11.2023.
//

import Foundation
import NetwotkService

struct Car: Equatable, Identifiable {
    let id: UUID
    var name: String
    var colorCar: String = ""
    var quantityOfPetrol: Double = 0.0
    var numberCar: String = ""
    var isRent: Bool = false
    
    init(from entity: CarEntity) {
        self.id = entity.id
        self.name = entity.name
        self.colorCar = entity.colorCar
        self.quantityOfPetrol = entity.quantityOfPetrol
        self.numberCar = entity.numberCar
        self.isRent = entity.isRent
    }
}
