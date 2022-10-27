//
//  CreatePasscodeView.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 24/10/2022.
//

import SwiftUI

struct CreatePasscodeView: View {
    @Binding var isCreated: Bool
    @AppStorage("createdPasscode") var createdPasscode: String = ""
    
    @Binding var isConfirmed: Bool
    @AppStorage("confirmPasscode") var confirmPasscode: String = ""
    
    var body: some View {
        VStack{
            Text("Create a passcode with a minimum of three numbers.")
                .multilineTextAlignment(.center)
                .padding()
                .task {
                    resetConfirmation()
                }
            
            if !isCreated{
                HStack{
                    Image(systemName: createdPasscode.count >= 1 ? "circle.fill" : "circle")
                    Image(systemName: createdPasscode.count >= 2 ? "circle.fill" : "circle")
                    Image(systemName: createdPasscode.count >= 3 ? "circle.fill" : "circle")
                    Image(systemName: createdPasscode.count >= 4 ? "circle.fill" : "circle")
                    Image(systemName: createdPasscode.count == 5 ? "circle.fill" : "circle")
                }
                .padding()
            } else {
                HStack{
                    Image(systemName: "circle")
                    Image(systemName: "circle")
                    Image(systemName: "circle")
                    Image(systemName: "circle")
                    Image(systemName: "circle")
                }
                .padding()
            }
            
            VStack {
                HStack{
                    ForEach(1..<4) { number in
                        PasscodeButton(passcode: $createdPasscode, number: number)
                    }
                }
                HStack{
                    ForEach(4..<7) { number in
                        PasscodeButton(passcode: $createdPasscode, number: number)
                    }
                }
                HStack{
                    ForEach(7..<10) { number in
                        PasscodeButton(passcode: $createdPasscode, number: number)
                    }
                }
                HStack{
                    DeleteButton(isCreated: $isCreated, passcode: $createdPasscode)
                    
                    PasscodeButton(passcode: $createdPasscode, number: 0)
                    
                    CreateShortePasscode(passcode: $createdPasscode, created: $isCreated)
                }
            }
//            Text(String(isCreated))
        }
    }
    
    private func resetConfirmation() {
        createdPasscode = ""
        confirmPasscode = ""
        isCreated = false
        isConfirmed = false
    }
}

//struct CreatePasscodeView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreatePasscodeView()
//    }
//}

struct PasscodeButton: View {
    @Binding var passcode: String
    @State var number: Int
    
    @AppStorage("isCreated") var isCreated: Bool = false
    
    var body: some View {
        Button{
            withAnimation(.easeInOut) {
                if passcode.count < 5 {
                    passcode.append(String(number))
                }
                //            else if passcode.count == 5 {
                //                isCreated = true
                //            }
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

struct DeleteButton: View {
    @Binding var isCreated: Bool
    @Binding var passcode: String
    
    var body: some View {
        Button{
            withAnimation(.easeInOut) {
                if passcode != ""{
                    passcode.removeLast()
                    isCreated = false
                }
            }
        } label: {
            Image(systemName: "delete.backward.fill")
                .font(.headline)
                .padding()
                .padding()
                .background(Circle()
                    .stroke( lineWidth: 2))
                .foregroundColor(Color("buttonText"))
        }
    }
}

struct CreateShortePasscode: View {
    @Binding var passcode: String
    
    @Binding var created: Bool
    
    var body: some View {
        Button {
            withAnimation(.easeInOut) {
                if passcode.count >= 3 {
                    created = true
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


