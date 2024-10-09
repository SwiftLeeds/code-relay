//
//  Code_RelayApp.swift
//  Code Relay
//
//  Created by Adam Rush on 17/09/2024.
//

import SwiftUI

@main
struct Code_RelayApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            NotificationCenter.default.post(name: .shake, object: nil)
        }
    }
}
