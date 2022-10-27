//
//  PasscodeView.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 24/10/2022.
//

import SwiftUI

struct PasscodeView: View {
    @AppStorage("isCreated") var isCreated: Bool = false
    @Binding var isConfirmed: Bool
    
    var body: some View {
        if !isCreated {
            CreatePasscodeView(isCreated: $isCreated, isConfirmed: $isConfirmed)
        } else {
            ZStack{
                ConfirmPasscodeView(isConfirmed: $isConfirmed)
                
                HStack {
                    VStack {
                        Button{
                            withAnimation(.easeInOut) {
                                isCreated = false
                            }
                        } label: {
                            Image(systemName: "arrowshape.turn.up.backward.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(Color("appButton"))
                                .padding()
                        }
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
    }
}

//struct PasscodeView_Previews: PreviewProvider {
//    static var previews: some View {
//        PasscodeView()
//    }
//}
