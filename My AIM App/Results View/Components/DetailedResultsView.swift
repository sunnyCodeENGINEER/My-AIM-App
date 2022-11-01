//
//  DetailedResultsView.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 29/10/2022.
//

import SwiftUI

struct DetailedResultsView: View {
    @Binding var selectedResult: Result
//    @State var result: Result = Results.loadResults.results[0]
    
    @Binding var showDetails: Bool
    @State var gradeColor: Color = Color("firstClass")
    @State var showGrades: Bool = false
    @State var grade: String = "A"
    
    var body: some View {
        ZStack {
            VStack{
                CwaCircle(selectedResult: $selectedResult)
                
                ScrollView(.vertical, showsIndicators: true){
                    VStack{
                        ForEach(0..<selectedResult.courses.count) { item in
                            DetailedResultsRow(subject: selectedResult.courses[item].name, mark: Double(selectedResult.courses[item].score)!)
                                .opacity(showGrades ? 1 : 0)
                                .animation(.easeInOut(duration: 3), value: showGrades)
                        }
                    }
                    .padding(.top)
                }
                .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            showGrades = true
                        }
                }
            }
            HStack {
                VStack {
                    Button {
                        withAnimation(.easeInOut) {
                            showDetails = false
                        }
                    } label: {
                        Image(systemName: "arrowshape.turn.up.backward.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(Color("appButton"))
                            .background(Circle().foregroundColor(.white))
                        
                }
                    .padding()
                    Spacer()
                }
                Spacer()
            }
        }
        
    }
    
}

struct CwaCircle: View {
    @Binding var selectedResult: Result
    
    @State var cwaColor = Color("appButton")
    @State var showCWARingBG: Bool = false
    @State var showCWARing: Bool = false
    @State var showCWAText: Bool = false
    @State var currentCWA: CGFloat = 0
    
    var body: some View {
        VStack{
            ZStack{
                Circle()
                    .foregroundColor(Color("gradient"))
                    .blur(radius: 10)
                    .shadow(color: .black.opacity(0.8), radius: 30, x: 10, y: 10)
                
                Circle()
                    .stroke(lineWidth: 30)
                    .foregroundColor(showCWARingBG ? cwaColor.opacity(0.3) : Color("gradient"))
                    .animation(.easeInOut(duration: 1), value: showCWARingBG)
                    .padding()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            showCWARingBG = true
                        }
                    }
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(currentCWA, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .foregroundColor(cwaColor)
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut(duration: 3), value: currentCWA)
                    .padding()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                            showCWARing = true
                            currentCWA = CGFloat(Int(selectedResult.currentCWA)!) / 100
                        }
                    }
                
                VStack{
                    Text("CWA")
                    
                    Text(selectedResult.currentCWA)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(cwaColor)
                        .opacity(showCWAText ? 1 : 0)
                        .animation(.easeInOut(duration: 3), value: showCWAText)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                showCWAText = true
                            }
                        }
                }
            }
            .frame(width: UIScreen.main.bounds.width / 1.5, height: UIScreen.main.bounds.width / 1.2)
            
            HStack {
                Text("Average for Level \(selectedResult.level) semester \(selectedResult.semester) is:")
                Text("\(selectedResult.averageForSemester)")
                    .foregroundColor(cwaColor)
            }
            .opacity(showCWAText ? 1 : 0)
            .animation(.easeInOut(duration: 3), value: showCWAText)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    showCWAText = true
                }
            }
                
        }
        .padding(.top)
    }
}

