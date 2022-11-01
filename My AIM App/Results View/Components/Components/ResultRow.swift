//
//  ResultRow.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 29/10/2022.
//

import SwiftUI

struct ResultRow: View {
    @State var result: Result
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                
                Text(result.academicYear + " Academic Year")
                    .foregroundColor(Color("buttonText"))
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 40)
                        .foregroundColor(Color("appButton")))
                Text("level \(result.level)".uppercased())
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("Semester " + result.semester)
                    .font(.title2)
            }
            .padding()
            
            Spacer()
        }
        .background(RoundedRectangle(cornerRadius: 30)
            .foregroundColor(Color("appButton").opacity(0.3)))
        .overlay(RoundedRectangle(cornerRadius: 30)
            .stroke(Color("gradient"), lineWidth: 3))
        .padding()
        
    }
}

struct ResultRow_Previews: PreviewProvider {
    static var previews: some View {
        ResultRow(result: Results.loadResults.results[0]).environmentObject(Results.loadResults)
    }
}
