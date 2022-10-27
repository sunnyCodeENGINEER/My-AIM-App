//
//  ConfirmPasscodeView.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 24/10/2022.
//

import SwiftUI

struct ConfirmPasscodeView: View {
    @AppStorage("createdPasscode") var createdPasscode: String = ""
    @Binding var isConfirmed: Bool
    
    @State var confirm = false
    @AppStorage("confirmPasscode") var confirmPasscode: String = ""
    
    var body: some View {
        VStack{
            Text("Confirm your passcode")
            
            if !isConfirmed {
                HStack{
                    ForEach(0..<createdPasscode.count) { code in
                        Image(systemName: confirmPasscode.count >= code+1 ? "circle.fill" : "circle")
                    }
                }
                .padding()
                
            } else {
                HStack{
                    ForEach(0..<createdPasscode.count) { code in
                        Image(systemName: "circle")
                    }
                }
                .padding()
            }
            
            VStack {
                HStack{
                    ForEach(1..<4) { number in
                        ConfirmPasscodeButton(passcode: $confirmPasscode, number: number, confirm: $confirm)
                    }
                }
                HStack{
                    ForEach(4..<7) { number in
                        ConfirmPasscodeButton(passcode: $confirmPasscode, number: number, confirm: $confirm)
                    }
                }
                HStack{
                    ForEach(7..<10) { number in
                        ConfirmPasscodeButton(passcode: $confirmPasscode, number: number, confirm: $confirm)
                    }
                }
                HStack{
                    DeleteButton(isCreated: $isConfirmed, passcode: $confirmPasscode)
                    
                    ConfirmPasscodeButton(passcode: $confirmPasscode, number: 0, confirm: $confirm)
                    
                    ConfirmnowPasscode(createdPasscoed: $createdPasscode, passcode: $confirmPasscode, confirm: $isConfirmed)
                }
            }
//            Text(String(isConfirmed))
            
        }
    }
}

//struct ConfirmPasscodeView_Previews: PreviewProvider {
//    static var previews: some View {
//        ConfirmPasscodeView()
//    }
//}

struct ConfirmPasscodeButton: View {
    @Binding var passcode: String
    @State var number: Int
    
    @Binding var confirm: Bool
    
    @AppStorage("isConfirmed") var isConfirmed: Bool = false
    @AppStorage("createdPasscode") var createdPasscode: String = ""
    
    var body: some View {
        Button{
            withAnimation(.easeInOut) {
                if passcode.count < createdPasscode.count {
                    passcode.append(String(number))
                }
            }
        } label: {
            VStack{
                Text("\(number)")
                    .font(.title)
                    .padding()
                    .padding()
                    .background(Circle()
                        .stroke( lineWidth: 2))
                    .foregroundColor(Color("buttonText"))
            }
        }
    }
}


struct ConfirmnowPasscode: View {
    @Binding var createdPasscoed: String
    @Binding var passcode: String
    
    @Binding var confirm: Bool
    
    var body: some View {
        Button {
            withAnimation(.easeInOut) {
                if passcode.count >= 3 {
                    if createdPasscoed == passcode {
                        confirm = true
                    } else {
                        confirm = false
                    }
                }
            }
        } label: {
            Image(systemName: "checkmark")
                .font(.largeTitle)
                .fontWeight(.bold)
//                .padding()
                .padding()
//                .background(Circle()
//                    .stroke( lineWidth: 2))
                .foregroundColor(Color("buttonText"))
        }
    }
}
