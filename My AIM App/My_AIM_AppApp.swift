//
//  My_AIM_AppApp.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 23/10/2022.
//

import SwiftUI

@main
struct My_AIM_AppApp: App {
    @Environment(\.scenePhase) var scenePhase
    @State var unlocked: Bool = false
    @State var useBiometrics: Bool = true
    
    var body: some Scene {
        WindowGroup {
            ContentView(useBiometrics: $useBiometrics, unlocked: $unlocked)
                .onChange(of: scenePhase) { phase in
                    switch phase {
                    case .background :
                        useBiometrics = true
                        unlocked = false
                    case .inactive :
                        useBiometrics = true
                        unlocked = false
                    case .active:
                        break
                    @unknown default:
                        unlocked = false
                        useBiometrics = true
                    }
                }
        }
        
    }
}
