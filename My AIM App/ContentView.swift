//
//  ContentView.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 23/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    @Binding var useBiometrics: Bool
    @Binding var unlocked: Bool
    var body: some View {
        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//            PasscodeView()
            
            AppSecureAccessView(useBiometrics: $useBiometrics, unlocked: $unlocked)
//            HomeView()
        }
//        .padding()
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
