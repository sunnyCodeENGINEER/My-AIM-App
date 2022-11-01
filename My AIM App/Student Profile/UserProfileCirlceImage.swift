//
//  UserProfileCirlceImage.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 28/10/2022.
//

import SwiftUI

struct UserProfileCirlceImage: View {
    @EnvironmentObject var user: User
    
    private var width = UIScreen.main.bounds.width / 2.2
    private var resolutionAdjust: Bool = getResolution(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    
    var body: some View {
        ZStack{
            
            Image(user.image)
                .resizable()
                .scaledToFit()
                .frame(width: width * 0.8)
                .background(Circle()
                    .frame(width: width / 2)
                    .foregroundColor(Color("appButton")))
                .cornerRadius(width)
                .overlay(Circle().stroke(Color("gradient"), lineWidth: 4))
                .background(RoundedRectangle(cornerRadius: width / 2)
                    .frame(width: width, height: UIScreen.main.bounds.height)
                    .foregroundColor(Color("appButton"))
                    .offset(y: -UIScreen.main.bounds.height / 2.55)
                    .offset(y: resolutionAdjust ? 17 : 0)
                )
                .shadow(color: .black.opacity(0.3), radius: 20)
        }
        .padding(.top)
    }
}

struct UserProfileCirlceImage_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileCirlceImage().environmentObject(User.loadUser)
    }
}

func getResolution(width: CGFloat, height: CGFloat) -> Bool {
    if (height / width ) < 1.85 {
        return true
    } else {
        return false
    }
}
