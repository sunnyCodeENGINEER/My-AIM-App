//
//  NextClassCard.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 31/10/2022.
//

import SwiftUI

struct NextClassCard: View {
    
    @State var nextClass: Class
    
    
    
    var body: some View {
        if !getResolution(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height) {
            HStack {
                HStack {
                    VStack {
                        Image(systemName: "text.book.closed.fill")
                            .resizable()
                        
                            .foregroundColor(Color("appButton"))
                            .scaledToFit()
                            .padding()
                            .shadow(color: .black.opacity(0.6), radius: 20, x: 5, y: 10)
                            .offset(y: -60)
                    }
                    .frame(width: 200, height: 250)
                    
                    VStack(alignment: .leading) {
                        Text(nextClass.courseCode)
                            .font(.system(size: 30, weight: .bold))
                        Text(nextClass.courseName)
                            .font(.title2)
                        Divider()
                        HStack {
                            Text("Classroom: ")
                                .fontWeight(.bold)
                            Text(nextClass.classroom)
                        }
                        HStack {
                            Text("Time: ")
                                .fontWeight(.bold)
                            Text(nextClass.time)
                        }
                        HStack {
                            Text("Lecturer: ")
                                .fontWeight(.bold)
                            Text("\(nextClass.lecturerTitle) \(nextClass.lecturerName)")
                        }
                    }
                    .padding(.trailing)
                }
                .background(RoundedRectangle(cornerRadius: 30)
                    .fill(.ultraThickMaterial)
                    .frame( height: 250)
                    .overlay(RoundedRectangle(cornerRadius: 40).stroke(lineWidth: 5)))
            }
            .frame(width: UIScreen.main.bounds.width * 0.9, height: 350)
            
            .padding(.horizontal, 5.0)
        } else {
            HStack {
                HStack {
                    VStack {
                        Image(systemName: "text.book.closed.fill")
                            .resizable()
                            
                            .foregroundColor(Color("appButton"))
                            .scaledToFit()
                            .padding()
                            .shadow(color: .black.opacity(0.6), radius: 20, x: 5, y: 10)
                        .offset(y: -60)
                    }
                    .frame(width: 100, height: 150)
                    
                    VStack(alignment: .leading) {
                        Text(nextClass.courseCode)
                            .font(.system(size: 30, weight: .bold))
                        Text(nextClass.courseName)
                            .font(.title2)
                        Divider()
                        HStack {
                            Text("Classroom: ")
                                .fontWeight(.bold)
                            Text(nextClass.classroom)
                        }
                        HStack {
                            Text("Time: ")
                                .fontWeight(.bold)
                            Text(nextClass.time)
                        }
                        HStack {
                            Text("Lecturer: ")
                                .fontWeight(.bold)
                            Text("\(nextClass.lecturerTitle) \(nextClass.lecturerName)")
                        }
                    }
                    .padding(.trailing)
                }
                .background(RoundedRectangle(cornerRadius: 30)
                    .fill(.ultraThickMaterial)
                    .frame( height: 170)
                .overlay(RoundedRectangle(cornerRadius: 40).stroke(lineWidth: 2)))
            }
            .frame(width: UIScreen.main.bounds.width * 0.9, height: 250)
            
            .padding(.horizontal, 5.0)
            .padding(.bottom)
        }
    }
}

//struct NextClassCard_Previews: PreviewProvider {
//    static var previews: some View {
//        NextClassCard(nextClass: NextClass.loadClasses.classes[0])
//    }
//}
