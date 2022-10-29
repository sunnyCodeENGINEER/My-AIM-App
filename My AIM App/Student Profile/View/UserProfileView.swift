//
//  UserProfileView.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 28/10/2022.
//

import SwiftUI

struct UserProfileView: View {
    @Binding var currentPage: CurrentPage
    @State var display: Displayed = .personal
    
    @State var animateProfileImage: Bool = false
    @State var animateTabs: Bool = false
    @State var animateRows: Bool = false
    
    var body: some View {
        ZStack {
            VStack{
                UserProfileViewHeader()
                    .offset(y: animateProfileImage ? 0 : -1000)
                
                MyTabView(display: $display)
                    .opacity(animateTabs ? 1 : 0)
                
                Divider()
                
                switch display {
                case .personal:
                    UserPersonalInfoView()
                        .opacity(animateRows ? 1 : 0)
                case .contact:
                    UserContactInfoView()
                        .opacity(animateRows ? 1 : 0)
                case .course:
                    EmptyView()
                }
            }
            
            VStack {
                HStack {
                    Button {
                        withAnimation(.easeInOut) {
                            currentPage = .welcomeScreen
                        }
                    } label: {
                        Image(systemName: "arrowshape.turn.up.backward.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(Color("appButton"))
                    }
                    Spacer()
                }
                .padding()
                Spacer()
            }
        }
        .task {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                animateProfileImage = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                animateTabs = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                animateRows = true
            }
        }
    }
}

//struct UserProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfileView().environmentObject(User.loadUser)
//    }
//}
