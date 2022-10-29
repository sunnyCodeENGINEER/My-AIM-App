//
//  UserProfileViewHeader.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 28/10/2022.
//

import SwiftUI

struct UserProfileViewHeader: View {
    var body: some View {
        VStack{
            UserProfileCirlceImage()
            
            UserProfileSummary()
        }
    }
}

struct UserProfileViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileViewHeader().environmentObject(User.loadUser)
    }
}
