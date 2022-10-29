//
//  UserPersonalInfoView.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 28/10/2022.
//

import SwiftUI

struct UserPersonalInfoView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        let titles: [String] = ["Firstname", "Surname", "Other names", "Title", "Gender", "Age", "Birthday", "Nationality", "Religion"]
        
        let contents: [String] = [user.firstName, user.surname, user.otherNames, user.title, user.gender, String(user.age),user.birthDay, user.nationality, user.religion]
        
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                ForEach(0..<9) { index in
                    UserInfoRow(title: titles[index], bodyText: contents[index])
                }
            }
        }
    }
}

struct UserPersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserPersonalInfoView().environmentObject(User.loadUser)
    }
}
