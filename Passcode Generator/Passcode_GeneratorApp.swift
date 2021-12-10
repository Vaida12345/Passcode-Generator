//
//  Passcode_GeneratorApp.swift
//  Passcode Generator
//
//  Created by Vaida on 11/30/21.
//

import SwiftUI

@main
struct Passcode_GeneratorApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 800, maxWidth: .infinity, minHeight: 600, maxHeight: .infinity)
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}
