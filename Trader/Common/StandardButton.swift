//
//  StandardButton.swift
//  Trader
//
//  Created by nikolamilic on 3/7/23.
//

import SwiftUI

struct StandardButton: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(Style.Colors.purple.opacity(isEnabled ? 1 : 0.35))
            .font(.headline)
            .padding()
            .frame(height: 44)
            .background(.clear)
            .border(Style.Colors.purple.opacity(isEnabled ? 1 : 0.35), width: 2)
    }
}

struct StandardButton_Previews: PreviewProvider {
    static var previews: some View {
        Button("Test button", action: {})
            .buttonStyle(StandardButton())
    }
}
