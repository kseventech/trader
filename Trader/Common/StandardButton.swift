//
//  StandardButton.swift
//  Trader
//
//  Created by nikolamilic on 3/7/23.
//

import SwiftUI

struct StandardButton: ButtonStyle {
    enum Role {
        case standard, buy, sell
    }

    @Environment(\.isEnabled) private var isEnabled: Bool
    private(set) var role: Role = .standard

    private var foregroundColor: Color {
        switch self.role {
        case .standard: return Style.Colors.purple
        case .buy: return Style.Colors.green
        case .sell: return Style.Colors.red
        }
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(foregroundColor.opacity(isEnabled ? 1 : 0.35))
            .font(.headline)
            .padding()
            .frame(height: 44)
            .background(.clear)
            .border(foregroundColor.opacity(isEnabled ? 1 : 0.35), width: 2)
    }
}

struct StandardButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button("Standard button", action: {})
                .buttonStyle(StandardButton(role: .standard))

            Button("Buy button", action: {})
                .buttonStyle(StandardButton(role: .buy))

            Button("Sell button", action: {})
                .buttonStyle(StandardButton(role: .sell))
        }
    }
}
