//
//  UserProfileSummary.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 28/10/2022.
//

import SwiftUI

struct UserProfileSummary: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(user.surname.uppercased() + ",")
                    .font(.title)
                    .fontWeight(.black)
                
                Text("\(user.firstName) \(user.otherNames)")
                
                HStack{
                    Text(user.course)
                    Image(systemName: "circle.fill")
                    Text("level 200")
                }
                .font(.caption)
                .foregroundColor(.gray)
            }
            .padding()
            
            Spacer()
        }
        
    }
}

struct UserProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileSummary().environmentObject(User.loadUser)
    }
}
