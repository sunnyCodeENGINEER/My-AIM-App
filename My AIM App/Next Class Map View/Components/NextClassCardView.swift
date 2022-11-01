//
//  NextClassCardView.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 31/10/2022.
//

import SwiftUI

struct NextClassCardView: View {
    @EnvironmentObject var classess: NextClass
    
    var body: some View {
        VStack {
            Spacer()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .bottom) {
                    ForEach(0..<4) { index in
                        NextClassCard(nextClass: classess.classes[index])
                    }
                }
            }
            
        }
    }
}

struct NextClassCardView_Previews: PreviewProvider {
    static var previews: some View {
        NextClassCardView().environmentObject(NextClass.loadClasses)
    }
}
