//
//  CarDetailFeature.swift
//  HW_4_OTUS_2023
//
//  Created by Филатов Олег Олегович on 04.11.2023.
//

import ComposableArchitecture
import Foundation

struct CarDetailFeature: Reducer {
    struct State: Equatable {
        @PresentationState var alert: AlertState<Action.Alert>?
        var car: Car
    }
    
    enum Action: Equatable {
        case alert(PresentationAction<Alert>)
        case delegate(Delegate)
        case rentButtonTapped
        enum Alert {
            case confirmRent
        }
        enum Delegate {
            case confirmRent
        }
    }
    
    @Dependency(\.dismiss) var dismiss
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .alert(.presented(.confirmRent)):
                return .run { send in
                    await send(.delegate(.confirmRent))
                    await self.dismiss()
                }
            case .alert:
                return .none
            case .delegate:
                return .none
            case .rentButtonTapped:
                state.alert = .confirmRent
                return . none
            }
        }
        .ifLet(\.$alert, action: /Action.alert)
    }
}

extension AlertState where Action == CarDetailFeature.Action.Alert {
    static let confirmRent = Self {
        TextState("Are you sure?")
    } actions: {
        ButtonState(role: .destructive, action: .confirmRent) {
            TextState("YES")
        }
    }
}
