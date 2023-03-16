//
//  PickAssetViewModel.swift
//  Trader
//
//  Created by nikolamilic on 3/8/23.
//

import Foundation
import SwiftUI

protocol PickAssetViewModel: ObservableObject {
    func getCoins() async
}

@MainActor final class PickAssetViewModelImpl: PickAssetViewModel {
    @Published private(set) var coins: [Coin] = []
    @Published private(set) var selectedCoin: Coin?

    private let service: CoinsService

    init(service: CoinsService = CoinsServiceImpl()) {
        self.service = service
    }

    func getCoins() async {
        do {
            self.coins = try await service.fetchTop100CoinsByUsdMktCap()
        } catch {
            print(error)
        }
    }

    func selectCoin(coin: Coin) {
        self.selectedCoin = coin
    }
}
