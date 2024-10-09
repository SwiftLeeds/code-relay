//
//  SettingsView.swift
//  Code Relay
//
//  Created by Mikaela Caron on 10/8/24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Text("Developed at ") +
            Text("SwiftLeeds ❤️")
                .font(.title)
                .bold()
                .foregroundStyle(.red)
        }
    }
}

#Preview {
    SettingsView()
}
