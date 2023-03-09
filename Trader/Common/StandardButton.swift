//
//  StandardButton.swift
//  Trader
//
//  Created by nikolamilic on 3/7/23.
//

import SwiftUI

struct StandardButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(Style.Colors.purple)
            .font(.headline)
            .padding()
            .frame(height: 44)
            .background(.clear)
            .border(Style.Colors.purple, width: 2)
    }
}

struct StandardButton_Previews: PreviewProvider {
    static var previews: some View {
        Button("Test button", action: {})
            .buttonStyle(StandardButton())
    }
}
