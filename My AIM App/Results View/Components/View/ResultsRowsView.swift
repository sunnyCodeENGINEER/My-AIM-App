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
    var body: some View {
        ZStack{
            ResultsRowBG()
            
            ResultsRowTitle(showDetails: $showDetails)
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        currentPage = .welcomeScreen
                    }
                }
        }
    }
}
