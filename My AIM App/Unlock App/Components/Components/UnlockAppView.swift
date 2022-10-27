//
//  UnlockAppView.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 24/10/2022.
//

import SwiftUI

struct UnlockAppView: View {
//    @State var createdPasscode: String = ""
    @State var enteredPasscode: String = ""
    @Binding var unlocked: Bool
    
    @AppStorage("createdPasscode") var createdPasscode: String = ""
    
    var body: some View {
        VStack{
            Text("Enter your passcode")
            
                HStack{
                    ForEach(0..<createdPasscode.count) { code in
                        Image(systemName: enteredPasscode.count >= code+1 ? "circle.fill" : "circle")
                    }
                }
                .padding()
            
            VStack {
                HStack{
                    ForEach(1..<4) { number in
                        ConfirmPasscodeButton(passcode: $enteredPasscode, number: number, confirm: $unlocked)
                    }
                }
                HStack{
                    ForEach(4..<7) { number in
                        ConfirmPasscodeButton(passcode: $enteredPasscode, number: number, confirm: $unlocked)
                    }
                }
                HStack{
                    ForEach(7..<10) { number in
                        ConfirmPasscodeButton(passcode: $enteredPasscode, number: number, confirm: $unlocked)
                    }
                }
                HStack{
                    DeleteButton(isCreated: $unlocked, passcode: $enteredPasscode)
                    
                    ConfirmPasscodeButton(passcode: $enteredPasscode, number: 0, confirm: $unlocked)
                    
                    ConfirmnowPasscode(createdPasscoed: $createdPasscode, passcode: $enteredPasscode, confirm: $unlocked)
                }
            }
//            Text(String(unlocked))
            
        }
    }
}

//struct UnlockAppView_Previews: PreviewProvider {
//    static var previews: some View {
//        UnlockAppView()
//    }
//}
