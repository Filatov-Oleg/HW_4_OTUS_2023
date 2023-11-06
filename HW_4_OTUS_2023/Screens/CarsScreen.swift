//
//  CarsView.swift
//  HW_4_OTUS_2023
//
//  Created by Филатов Олег Олегович on 04.11.2023.
//

import ComposableArchitecture
import SwiftUI

struct CarsScreen: View {
    
    let store: StoreOf<CarsFeature>
    
    var body: some View {
        NavigationStackStore(self.store.scope(state: \.path, action: { .path($0) })) {
            WithViewStore(self.store, observe: \.cars) { viewStore in
                List {
                    ForEach(viewStore.state) { car in
                        NavigationLink(state: CarDetailFeature.State(car: car)) {
                            HStack {
                                Image(car.name)
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                    .frame(width: 160, height: 120)
                                    .padding(.trailing, 10)
                                Text(car.name)
                                Image(systemName: car.isRent ? "heart.fill" : "heart")
                                    .font(.title3)
                                    .foregroundColor(.red).bold(car.isRent)
                            }
                        }
                    }
                }
                .listStyle(.grouped)
                .onAppear {
                    viewStore.send(.fetchCars)
                }
                .navigationTitle("Rent Cars")
            }
        } destination: { store in
            CarDetailScreen(store: store)
        }
    }
}
