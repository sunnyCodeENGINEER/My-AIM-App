//
//  UserLoginView.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 23/10/2022.
//

import SwiftUI

struct UserLoginView: View {
    var body: some View {
        ZStack{
            LoginBackground()
            
            UserLoginTextView()
        }
    }
}

struct UserLoginView_Previews: PreviewProvider {
    static var previews: some View {
        UserLoginView()
    }
}
