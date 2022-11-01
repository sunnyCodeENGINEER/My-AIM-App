//
//  ContentView.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 23/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var user: User = User.loadUser
    @StateObject var classes: NextClass = NextClass.loadClasses
    
    @Binding var useBiometrics: Bool
    @Binding var unlocked: Bool
    var body: some View {
        VStack {
            AppSecureAccessView(useBiometrics: $useBiometrics, unlocked: $unlocked)
                .environmentObject(user)
                .environmentObject(classes)
        }
    }
}
