//
//  CoinsService.swift
//  Trader
//
//  Created by nikolamilic on 3/8/23.
//

import Foundation

protocol CoinsService {
    func fetchTop100CoinsByUsdMktCap() async throws -> [Coin]
}

final class CoinsServiceImpl: CoinsService {
    func fetchTop100CoinsByUsdMktCap() async throws -> [Coin] {
        let urlSession = URLSession.shared
        let url = URL(string: APIConstants.baseUrl
            .appending("/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"))!
        let (data, _) = try await urlSession.data(from: url)
        return try JSONDecoder().decode([Coin].self, from: data)
    }
}

final class CoinsServiceDummyImpl: CoinsService {
    func fetchTop100CoinsByUsdMktCap() async throws -> [Coin] {
        return Coin.dummyData()
    }
}
