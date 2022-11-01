//
//  ResultsRowsView.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 29/10/2022.
//

import SwiftUI

struct ResultsRowsView: View {
    @Binding var currentPage: CurrentPage
    @Binding var showDetails: Bool
    @Binding var selectedResult: Result
    
    var body: some View {
        ZStack{
            ResultsRowBG()
            
            ResultsRowTitle(showDetails: $showDetails, selectedResult: $selectedResult)
//                .onTapGesture {
//                    withAnimation(.easeInOut) {
//                        currentPage = .welcomeScreen
//                    }
//                }
            
            VStack {
                HStack {
                    Button {
                        withAnimation(.easeInOut) {
                            currentPage = .welcomeScreen
                        }
                    } label: {
                        Image(systemName: "arrowshape.turn.up.backward.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(Color("appButton"))
                            .background(Circle().foregroundColor(.white))
                    }
                    Spacer()
                }
                .padding(.horizontal)
                Spacer()
            }
        }
    }
}
