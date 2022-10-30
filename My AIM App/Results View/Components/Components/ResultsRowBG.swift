//
//  ResultsRowBG.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 29/10/2022.
//

import SwiftUI

struct ResultsRowBG: View {
    var body: some View {
        ZStack{
            Color("appButton")
                .ignoresSafeArea()
        }
    }
}

struct ResultsRowBG_Previews: PreviewProvider {
    static var previews: some View {
        ResultsRowBG()
    }
}
