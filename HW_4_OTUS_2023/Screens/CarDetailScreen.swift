//
//  CarDetailView.swift
//  HW_4_OTUS_2023
//
//  Created by Филатов Олег Олегович on 04.11.2023.
//

import ComposableArchitecture
import SwiftUI

struct CarDetailScreen: View {
    
    let store: StoreOf<CarDetailFeature>
    
    var body: some View {
        WithViewStore(self.store, observe: {$0}) { viewStore in
            VStack {
                VStack(alignment: .leading) {
                    Image(viewStore.car.name)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding(.horizontal)
                    VStack(alignment: .leading) {
                        Text("Color: " + viewStore.car.colorCar)
                        Text("Number of car: " + viewStore.car.numberCar)
                        Text("Petrol: " + String(format: "%g", viewStore.car.quantityOfPetrol))
                    }
                    .padding()
                }
                Spacer()
                Button {
                    viewStore.send(.rentButtonTapped)
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 6)
                            .foregroundColor(.orange)
                        HStack {
                            Text(viewStore.car.isRent ? "Cancel rental" : "Rent")
                                .foregroundColor(.black)
                        }
                        .padding(16)
                    }
                    .frame(width: 180, height: 45)
                }
            }
            .navigationTitle(viewStore.car.name)
        }
        .alert(store: self.store.scope(state: \.$alert, action: { .alert($0) }))
    }
}
