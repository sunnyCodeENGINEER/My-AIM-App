//
//  HomeView.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 25/10/2022.
//

import SwiftUI

struct HomeView: View {
    @Binding var currentPage: CurrentPage
    
    var body: some View {
        ZStack{
            HomeBackground(currentPage: $currentPage)
        }
        
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView().environmentObject(User.loadUser)
//    }
//}
