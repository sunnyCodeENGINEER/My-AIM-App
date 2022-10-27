//
//  BiometricUnlockView.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 24/10/2022.
//

import SwiftUI
import LocalAuthentication

struct BiometricUnlockView: View {
    @Binding var unlocked: Bool
    @State var succesful: Bool = true
    @Binding var useBiometrics: Bool
    
    @State var text = "Locked"
    var body: some View {
        VStack {
            UnlockAppView(unlocked: $unlocked)
                .onAppear {
                    useBiometrics = authenticate()
            }
            
            Button{
                useBiometrics = authenticate()
            } label: {
                HStack{
                    Text("Unlock with Biometrics.")
                        .font(.footnote)
                        .padding()
                        .foregroundColor(Color("appText"))
                        .background(RoundedRectangle(cornerRadius: 30)
                            .fill(Color("appButton")))
                        .shadow(color: .black.opacity(0.6), radius: 30)
                }
                .padding()
            }
        }
    }
    
    private func authenticate() -> Bool {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "For unlocking the app") { success, authenticationError in
                
                if success {
                    text = "Unlocked"
                    unlocked = true
                    
                }
                else {
                    text = " There was an error."
                    succesful = false
                }
            }
        } else {
            text = "Phone doesn't have biometrics."
            succesful = false
        }
        
        return succesful
    }
}

//struct BiometricUnlockView_Previews: PreviewProvider {
//    static var previews: some View {
//        BiometricUnlockView()
//    }
//}
