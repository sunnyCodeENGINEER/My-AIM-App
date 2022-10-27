//
//  HomeBackground.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 25/10/2022.
//

import SwiftUI

struct HomeBackground: View {
    var body: some View {
        ZStack{
            Color("appButton")
                .ignoresSafeArea()
            
            Color("appText")
                .ignoresSafeArea()
                .cornerRadius(30)
                .offset(y: 100)
        }
    }
}

struct HomeBackground_Previews: PreviewProvider {
    static var previews: some View {
        HomeBackground()
    }
}
