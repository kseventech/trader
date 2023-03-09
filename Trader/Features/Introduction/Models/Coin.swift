//
//  Coin.swift
//  Trader
//
//  Created by nikolamilic on 3/8/23.
//

import Foundation

struct Coin: Identifiable, Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case symbol
        case name
        case imageURLString = "image"
        case marketCapRank = "market_cap_rank"
    }

    let id: String
    let symbol: String
    let name: String
    let imageURLString: String
    let marketCapRank: Int
}

extension Coin {
    static func dummyData() -> [Coin] {
        return [
            Coin(id: "bitcoin",
                 symbol: "btc",
                 name: "Bitcoin",
                 imageURLString: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
                 marketCapRank: 1),

            Coin(id: "ethereum",
                 symbol: "eth",
                 name: "Ethereum",
                 imageURLString: "https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880",
                 marketCapRank: 2),

            Coin(id: "tether",
                 symbol: "usdt",
                 name: "Tether",
                 imageURLString: "https://assets.coingecko.com/coins/images/325/large/Tether.png?1668148663",
                 marketCapRank: 3),

            Coin(id: "binancecoin",
                 symbol: "bnb",
                 name: "BNB",
                 imageURLString: "https://assets.coingecko.com/coins/images/825/large/bnb-icon2_2x.png?1644979850",
                 marketCapRank: 4)
        ]
    }
}
