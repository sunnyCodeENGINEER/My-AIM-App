//
//  HomeViewNavigator.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 25/10/2022.
//

import SwiftUI

struct HomeViewNavigator: View {
    @Binding var useBiometrics: Bool
    @Binding var unlocked: Bool
    
    var body: some View {
        if unlocked {
            DisplayCurrentPage()
        } else {
            UnlockView(unlocked: $unlocked, useBiometrics: $useBiometrics)
        }
    }
}
