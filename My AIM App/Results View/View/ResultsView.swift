//
//  ResultsView.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 30/10/2022.
//

import SwiftUI

struct ResultsView: View {
    @Binding var currentPage: CurrentPage
    @State var showDetails: Bool = false
    
    var body: some View {
        VStack {
            if showDetails {
                DetailedResultsView(showDetails: $showDetails)
            } else {
                ResultsRowsView(currentPage: $currentPage, showDetails: $showDetails)
            }
        }
    }
}

