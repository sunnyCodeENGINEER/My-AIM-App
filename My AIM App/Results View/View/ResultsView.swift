//
//  ResultsView.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 30/10/2022.
//

import SwiftUI

struct ResultsView: View {
    @StateObject var results: Results = Results.loadResults
    
    @State var selectedResult: Result = Results.loadResults.results[0]
    
    @Binding var currentPage: CurrentPage
    @State var showDetails: Bool = false
    
    var body: some View {
        VStack {
            if showDetails {
                DetailedResultsView(selectedResult: $selectedResult, showDetails: $showDetails)
            } else {
                ResultsRowsView(currentPage: $currentPage, showDetails: $showDetails, selectedResult: $selectedResult)
                    .environmentObject(results)
            }
                
        }
    }
}

