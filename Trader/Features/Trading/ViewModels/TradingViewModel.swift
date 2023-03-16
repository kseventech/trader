//
//  TradingViewModel.swift
//  Trader
//
//  Created by nikolamilic on 3/16/23.
//

import Foundation
import SwiftUI

typealias ActionButtonConfiguration = (title: String, role: StandardButton.Role)

protocol TradingViewModel: ObservableObject {
    func getActionButtonConfiguration() async -> ActionButtonConfiguration
}

@MainActor final class TradingViewModelImpl: TradingViewModel {

    @Published public var direction: TradingDirection = .buy
    @Published public var option: TradingOption = .market

    public func getActionButtonConfiguration() -> ActionButtonConfiguration {
        switch direction {
        case .buy:
            return ("Buy", .buy)
        case .sell:
            return ("Sell", .sell)
        }
    }
}
