//
//  ResultRow.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 29/10/2022.
//

import SwiftUI

struct ResultRow: View {
    var academicYear: String = "2020/2021 Academic Year"
    var level: String = "level 200"
    var semester: String = "First Semester"
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text(academicYear)
                    .foregroundColor(Color("buttonText"))
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 40)
                        .foregroundColor(Color("appButton")))
                Text(level.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(semester)
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
        ResultRow()
    }
}
