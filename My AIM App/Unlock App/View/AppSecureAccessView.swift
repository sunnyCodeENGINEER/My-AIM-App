//
//  AppSecureAccessView.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 24/10/2022.
//

import SwiftUI

struct AppSecureAccessView: View {
    
    
    @Binding var useBiometrics: Bool
    @Binding var unlocked: Bool
    @AppStorage("isConfirmed") var isConfirmed: Bool = false

    var body: some View {
        if isConfirmed {
            HomeViewNavigator(useBiometrics: $useBiometrics, unlocked: $unlocked)
        } else {
            PasscodeView(isConfirmed: $isConfirmed)
        }
    }
}
