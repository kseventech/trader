//
//  TradingScreen.swift
//  Trader
//
//  Created by nikolamilic on 3/14/23.
//

import SwiftUI

struct TradingScreen: View {
    @StateObject var vm = TradingViewModelImpl()

    var body: some View {
        VStack {
            Spacer()
            priceChart
            Spacer()
            buySellPicker
            marketLimitPicker
            tradeAmount
            actionButton
        }
    }

    var priceChart: some View {
        Text("Price chart here")
    }

    var buySellPicker: some View {
        Picker(selection: $vm.direction, label: Text("")) {
            Text("Buy").tag(TradingDirection.buy)
            Text("Sell").tag(TradingDirection.sell)
        }
        .pickerStyle(SegmentedPickerStyle())
    }

    var marketLimitPicker: some View {
        Picker(selection: $vm.option, label: Text("")) {
            Text("Market").tag(TradingOption.market)
            Text("Limit").tag(TradingOption.limit)
        }
        .pickerStyle(SegmentedPickerStyle())
    }

    var tradeAmount: some View {
        switch vm.option {
        case .market:
            switch vm.direction {
            case .buy:
                return Text("Market View - buy")
            case .sell:
                return Text("Market View - sell")
            }
        case .limit:
            switch vm.direction {
            case .buy:
                return Text("Limit View - buy")
            case .sell:
                return Text("Limit View - sell")
            }
        }
    }

    var actionButton: some View {
        let actionConf = vm.getActionButtonConfiguration()
        return Button(actionConf.title, action: actionButtonPressed)
            .buttonStyle(StandardButton(role: actionConf.role))
    }

    private func actionButtonPressed() {
        // TODO
    }
}

struct TradingScreen_Previews: PreviewProvider {
    static var previews: some View {
        TradingScreen()
    }
}
