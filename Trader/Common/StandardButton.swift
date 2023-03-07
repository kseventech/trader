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
            .foregroundColor(.white)
            .padding()
            .frame(height: 44)
            .background(Style.Colors.purple)
            .cornerRadius(8)
    }
}

struct StandardButton_Previews: PreviewProvider {
    static var previews: some View {
        Button("Test button", action: {})
            .buttonStyle(StandardButton())
    }
}
