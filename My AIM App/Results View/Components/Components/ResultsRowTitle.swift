//
//  ResultsRowTitle.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 29/10/2022.
//

import SwiftUI

struct ResultsRowTitle: View {
    @Binding var showDetails: Bool
    var title: String = "Title"
    
    var body: some View {
        VStack {
            Text(title.uppercased())
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("appText"))
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color("gradient"))
                .ignoresSafeArea()
                .shadow(color: .black.opacity(0.9), radius: 30)
                
                VStack {
                    ScrollView(.vertical, showsIndicators: true) {
                        VStack {
                            ForEach (0..<9) { index in
                                
                                Button {
                                    withAnimation(.easeInOut) {
                                        showDetails = true
                                    }
                                } label: {
                                    ResultRow()
                                        .foregroundColor(Color("buttonText"))
                                }
                            }
                        }
                        
                    }
                }.padding(.top, 5.0)
            }
        }
    }
}
