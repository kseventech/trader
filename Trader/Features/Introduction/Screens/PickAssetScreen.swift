//
//  PickAssetScreen.swift
//  Trader
//
//  Created by nikolamilic on 3/7/23.
//

import SwiftUI

struct PickAssetScreen: View {
    @ObservedObject var vm: PickAssetViewModelImpl

    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]

    var body: some View {
        VStack {
            Text("Pick your asset")
                .font(.headline)
                .padding()

            Text("Top 100 coins by mkt. cap")
                .foregroundColor(Style.Colors.darkGray)
                .font(.footnote)

            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(vm.coins) { coin in
                        CoinView(coin: coin, isSelected: vm.selectedCoin?.id == coin.id)
                            .onTapGesture(perform: {
                                vm.selectCoin(coin: coin)
                            })
                    }
                })
            }
            .padding()

            Spacer()

            Text(vm.selectedCoin?.name ?? "")
                .font(.title3)
                .bold()
        }
        .navigationTitle("Pick your asset")
        .navigationBarTitleDisplayMode(.automatic)
        .task {
            await vm.getCoins()
        }
    }
}

struct PickAssetScreen_Previews: PreviewProvider {
    static var previews: some View {
        PickAssetScreen(vm: PickAssetViewModelImpl(service: CoinsServiceDummyImpl()))
    }
}
