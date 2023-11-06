//
//  CarsFeature.swift
//  HW_4_OTUS_2023
//
//  Created by Филатов Олег Олегович on 04.11.2023.
//

import ComposableArchitecture
import Foundation
import NetwotkService

struct CarsFeature: Reducer {
    
    struct State: Equatable {
        var cars: [Car] = []
        var path = StackState<CarDetailFeature.State>()
        @InjectedWrapper var networkService: NetwotkService?
        static func == (lhs: CarsFeature.State, rhs: CarsFeature.State) -> Bool {
            return true
        }
    }
    
    enum Action: Equatable {
        case fetchCars
        case openDetailCar
        case path(StackAction<CarDetailFeature.State, CarDetailFeature.Action>)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .fetchCars:
                state.cars = state.networkService?.getCars().map {Car(from: $0)} ?? []
                return .none
            case .openDetailCar:
                return .none
            case let .path(.element(id: id, action: .delegate(.confirmRent))):
                guard let carState = state.path[id: id]
                else { return .none }
                state.networkService?.rentCar(by: carState.car.id)
                return .none
            case .path:
                return .none
            }
        }
        .forEach(\.path, action: /Action.path) {
            CarDetailFeature()
        }
    }
}

