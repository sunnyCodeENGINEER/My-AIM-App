//
//  HomeScrollView.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 25/10/2022.
//

import SwiftUI

struct HomeScrollView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            
            VStack{
                NextClassButton()
                    .padding([.top, .leading, .trailing])
                    .padding(.top, 50)
                
                Text("Latest On Campus")
                    .font(.title2)
                    .fontWeight(.medium)
                    .padding(.leading)
                
                
                ForEach (0..<10) { index in
                    NewsRow()
                        .padding(.horizontal)
                }
            }
//            .offset(y: 100)
        }
        .ignoresSafeArea()
        
    }
}

struct HomeScrollView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScrollView()
    }
}
