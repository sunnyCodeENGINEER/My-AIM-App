//
//  DisplayCurrentPage.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 28/10/2022.
//

import SwiftUI

struct DisplayCurrentPage: View {
    @State var currentPage: CurrentPage = .welcomeScreen
    
    var body: some View {
        VStack{
            switch currentPage {
            case .welcomeScreen:
                HomeView(currentPage: $currentPage)
            case .profileScreen:
                UserProfileView(currentPage: $currentPage)
            case .payBillScreen:
                HomeView(currentPage: $currentPage)
            case .checkResultsScreen:
                ResultsView(currentPage: $currentPage)
            case .registerCourses:
                HomeView(currentPage: $currentPage)
            case .nextClass:
                NextClassMap(currentPage: $currentPage)
            }
        }
    }
}

struct DisplayCurrentPage_Previews: PreviewProvider {
    static var previews: some View {
        DisplayCurrentPage().environmentObject(User.loadUser)
    }
}
