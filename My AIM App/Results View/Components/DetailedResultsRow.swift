//
//  DetailedResultsRow.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 29/10/2022.
//

import SwiftUI

struct DetailedResultsRow: View {
    @State var subjectColor = Color("appButton")
    @State var subject: String
    @State var gradeStr: String = "A"
    @State var score: CGFloat = 0.0
    @State var mark: Double
    
    var body: some View {
        HStack{
            Text(subject)
                .onAppear {
                    setGradeColor(grade: mark)
                }
            
            Spacer()
            
            Text(String(format: "%.2f", score * 100) + "%")
                .animation(.easeInOut(duration: 1), value: score)
                .padding()
            
            ZStack {
                Circle()
                    .stroke(lineWidth: 10)
                    .foregroundColor(subjectColor.opacity(0.3))
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(score, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 8,
                                        lineCap: .round))
                    .foregroundColor(subjectColor)
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut(duration: 3), value: score)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            score = CGFloat(mark) / 100
                        }
                    }
                
                Text(gradeStr)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .animation(.easeInOut(duration: 3), value: score)
                    
            }
            .frame(width: 60)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 25)
            .foregroundColor(subjectColor.opacity(0.3))
        )
        .overlay(RoundedRectangle(cornerRadius: 25)
            .stroke(subjectColor, lineWidth: 4))
        .padding()
        
    }
    func setGradeColor(grade: Double) {
        switch grade{
        case 0..<50:
            subjectColor = Color("thirdClass")
            gradeStr = "F"
        case 50..<60:
            subjectColor = Color("secondLower")
            gradeStr = "D"
        case 50..<70:
            subjectColor = Color("secondUpper")
            gradeStr = "B"
        case 70..<100:
            subjectColor = Color("firstClass")
            gradeStr = "A"
        default:
            subjectColor = Color("gradient")
            gradeStr = "F"
        }
    }
}

struct DetailedResultsRow_Previews: PreviewProvider {
    static var previews: some View {
        DetailedResultsRow(subject: "Subject", mark: 45)
    }
}
