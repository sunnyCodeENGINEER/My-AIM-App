//
//  HomeBackground.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 25/10/2022.
//

import SwiftUI

struct HomeBackground: View {
    @Binding var currentPage: CurrentPage
    @State private var animateBG: Bool = false
    @State private var animateHeader: Bool = false
    @State private var animateBody: Bool = false
    
    var body: some View {
        ZStack{
            Color("appButton")
                .opacity(animateBG ? 1 : 0)
                .ignoresSafeArea()
            
            Color("appText")
                .ignoresSafeArea()
                .cornerRadius(30)
                .offset(y: 100)
                .opacity(animateBG ? 1 : 0)
            
            VStack {
                UserImageHomeView(currentPage: $currentPage)
                    .opacity(animateHeader ? 1 : 0)
                
                HomeScrollView(currentPage: $currentPage)
                    .offset(y: animateBody ? 0 : -1000)
            }
        }
        .task {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                animateBG = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                animateHeader = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                animateBody = true
            }
        }
    }
}

