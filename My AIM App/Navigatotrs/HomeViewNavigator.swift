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
//            HomeView()
            DisplayCurrentPage()
        } else {
            UnlockView(unlocked: $unlocked, useBiometrics: $useBiometrics)
        }
    }
}

//struct HomeViewNavigator_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeViewNavigator()
//    }
//}
