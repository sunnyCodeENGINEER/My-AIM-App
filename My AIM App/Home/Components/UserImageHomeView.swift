//
//  UserImageHomeView.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 27/10/2022.
//

import SwiftUI

struct UserImageHomeView: View {
    @EnvironmentObject var user: User
    
    @Binding var currentPage: CurrentPage
    
    var body: some View {
        HStack {
            Button {
                withAnimation(.easeInOut) {
                    currentPage = .profileScreen
                }
            } label: {
                Image(user.image)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .mask(RoundedRectangle(cornerRadius: 30))
                    .overlay(RoundedRectangle(cornerRadius: 30)
                        .stroke(Color("appText"), lineWidth: 2))
                    .shadow(color: .black.opacity(0.9), radius: 20)
                    .padding(.leading)
            }
                
                VStack(alignment: .leading) {
                    Text(user.surname.uppercased() + ",")
                        .font(.title)
                        .fontWeight(.black)
                    Text("\(user.firstName) \(user.otherNames)")
                }
                .foregroundColor(Color("appText"))
                
                Spacer()
        }
        .padding()
    }
}

//struct UserImageHomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserImageHomeView().environmentObject(User.loadUser)
//    }
//}
