//
//  UserContactInfoView.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 28/10/2022.
//

import SwiftUI

struct UserContactInfoView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        let titles: [String] = ["Region", "City", "Postal Code", "Primary phone number", "School Email", "Residential Address 1", "Residential Address 2"]
        
        let contents: [String] = [user.address.region, user.address.city, user.address.postalCode, user.phoneNumbers[0].number, user.schoolEmail, user.residentialAddress1, user.residentialAddress2]
        
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                ForEach(0..<7) { index in
                    UserInfoRow(title: titles[index], bodyText: contents[index])
                }
            }
        }
    }
}

struct UserContactInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserContactInfoView().environmentObject(User.loadUser)
    }
}
