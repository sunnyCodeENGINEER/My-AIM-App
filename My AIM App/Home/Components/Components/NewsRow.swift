//
//  NewsRow.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 25/10/2022.
//

import SwiftUI

struct NewsRow: View {
    
    
    var body: some View {
        ZStack{
            Image(systemName: "person.3.fill")
                .resizable()
                .scaledToFit()
                .opacity(0.3)
            
            VStack{
                HStack {
                    Spacer()
                    HStack {
                        Image(systemName: "clock.arrow.circlepath")
                        Text("45 mins ago.")
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 30)
                        .fill(.thickMaterial))
                }
                Spacer()
                
                VStack(alignment: .leading) {
                    HStack{
                        Text("TITLE")
                        Spacer()
                    }
                    Text("Summary...")
                    
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 30)
                    .fill(.thickMaterial))
                .padding()
            }
        }
        .padding()
        .frame(height: 250)
        .background(RoundedRectangle(cornerRadius: 30)
            .fill(.thinMaterial))
        .padding()
    }
}

struct NewsRow_Previews: PreviewProvider {
    static var previews: some View {
        NewsRow()
    }
}
