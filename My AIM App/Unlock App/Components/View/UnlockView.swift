//
//  UnlockView.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 24/10/2022.
//

import SwiftUI

struct UnlockView: View {
    @Binding var unlocked: Bool
    @Binding var useBiometrics: Bool
    @State var usePasscode: Bool = false
    
    var body: some View {
        if !unlocked {
            if useBiometrics {
//                BiometricUnlockView(unlocked: $unlocked, useBiometrics: $useBiometrics, usePasscode: $usePasscode)
                BiometricUnlockView(unlocked: $unlocked, useBiometrics: $useBiometrics)
            } else {
                if !usePasscode {
                    VStack{
                        Text("Phone's Biometrics are not available.")
                        
                        Button{
                            usePasscode = true
                        } label: {
                            HStack{
                                Text("Unlock with Passcode.")
                                    .padding()
                                    .foregroundColor(Color("appText"))
                                    .background(RoundedRectangle(cornerRadius: 30)
                                        .fill(Color("appButton")))
                                    .shadow(color: .black.opacity(0.6), radius: 30)
                            }
                            .padding()
                        }
                    }
                } else {
                    UnlockAppView(unlocked: $unlocked)
//                    BiometricUnlockView(unlocked: $unlocked, useBiometrics: $useBiometrics)
                }
            }
        }
    }
}

//struct UnlockView_Previews: PreviewProvider {
//    static var previews: some View {
//        UnlockView()
//    }
//}
