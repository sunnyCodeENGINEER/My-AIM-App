//
//  UserInfoRow.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 28/10/2022.
//

import SwiftUI

struct UserInfoRow: View {
    @State var title: String
    @State var bodyText: String
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text(title.uppercased())
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(Color("appText"))
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(Color("appButton")))
                Spacer()
            }
             
            Text(bodyText)
                .padding(.leading)
        }
        .padding()
        .background(Color("appButton").opacity(0.3))
        .cornerRadius(25)
        .padding()
        
    }
}

struct UserInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoRow(title: "title", bodyText: "body")
    }
}
