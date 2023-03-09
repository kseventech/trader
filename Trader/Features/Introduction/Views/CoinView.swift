//
//  CoinView.swift
//  Trader
//
//  Created by nikolamilic on 3/8/23.
//

import SwiftUI
import Kingfisher

struct CoinView: View {
    let coin: Coin
    let isSelected: Bool

    var body: some View {
        KFImage(URL(string: coin.imageURLString))
            .placeholder({ _ in ProgressView()})
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
            .frame(maxWidth: 150, maxHeight: 150)
            .border(isSelected ? Style.Colors.green : Style.Colors.lightGray,
                    width: isSelected ? 3 : 2)
    }
}

struct CoinView_Previews: PreviewProvider {
    static var previews: some View {
        CoinView(coin: Coin.dummyData().first!,
                 isSelected: false)
            .previewDisplayName("Valid & Unselected")

        CoinView(coin: Coin.dummyData().first!,
                 isSelected: true)
            .previewDisplayName("Valid & Selected")

        CoinView(coin: Coin.init(id: "",
                                 symbol: "",
                                 name: "",
                                 imageURLString: "invalid_image",
                                 marketCapRank: 1),
                 isSelected: false)
            .previewDisplayName("Invalid")
    }
}
