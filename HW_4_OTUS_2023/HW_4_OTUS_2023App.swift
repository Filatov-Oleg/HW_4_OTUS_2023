//
//  HW_4_OTUS_2023App.swift
//  HW_4_OTUS_2023
//
//  Created by Филатов Олег Олегович on 26.10.2023.
//

import SwiftUI
import ComposableArchitecture

@main
struct HW_4_OTUS_2023App: App {
    
    init() {
        ServiceLocatorConfiguration.shared.createServices()
    }
    
    var body: some Scene {
        WindowGroup {
            CarsScreen(store: Store(initialState: CarsFeature.State(), reducer: {
                CarsFeature()
            }))
        }
    }
}
