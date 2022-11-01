//
//  NextClassView.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 31/10/2022.
//

import SwiftUI

struct NextClassView: View {
    @Binding var currentPage: CurrentPage
    @EnvironmentObject var classes: NextClass
    
    var body: some View {
        ZStack {
            NextClassMap(currentPage: $currentPage)
            
            NextClassCardView()
        }
       
    }
}

//struct NextClassView_Previews: PreviewProvider {
//    static var previews: some View {
//        NextClassView(currentPage: CurrentPage.nextClass, classes: NextClass.loadClasses)
//    }
//}
