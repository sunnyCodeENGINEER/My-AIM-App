//
//  HomeView.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 25/10/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            HomeBackground()
            
            
            HomeScrollView()
                .offset(y: 103)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
