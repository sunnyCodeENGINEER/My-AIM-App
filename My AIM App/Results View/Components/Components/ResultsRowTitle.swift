//
//  ResultsRowTitle.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 29/10/2022.
//

import SwiftUI

struct ResultsRowTitle: View {
    @EnvironmentObject var results: Results
    
    @Binding var showDetails: Bool
    var title: String = "Title"
    @Binding var selectedResult: Result
    
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
                            ForEach (0..<results.results.count) { index in
                                
                                Button {
                                    withAnimation(.easeInOut) {
                                        selectedResult = results.results[index]
                                        showDetails = true
                                    }
                                } label: {
                                    ResultRow(result: results.results[index])
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
