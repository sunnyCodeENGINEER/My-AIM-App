//
//  NextClassButton.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 25/10/2022.
//

import SwiftUI

struct NextClassButton: View {
    @Binding var currentPage: CurrentPage
    @State var animate: Bool = false
    
    var body: some View {
        Button{
            withAnimation(.easeInOut(duration: 2)) {
                currentPage = .nextClass
            }
        } label: {
            ZStack {
                Image(systemName: "map.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 200)
                    .rotationEffect(Angle(degrees: -30))
                    .offset(x: 10, y: 40)
                    .opacity(animate ? 0.1 : 0.2)
                    .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: animate)
                    .mask(RoundedRectangle(cornerRadius: 70))
                    
                HStack(alignment: .bottom){
                    Text("Where's\nmy\nnext\nclass")
                        .font(.title)
                        .fontWeight(.black)
                        .multilineTextAlignment(.leading)
                        .padding()

                        .shadow(color: Color("appText"), radius: 0.6)
                    Text("?")
                        .font(.system(size: 100))
                        .fontWeight(.black)
                        .offset(x: -40, y: 15)
                        .padding(.bottom)
                        .shadow(color: Color("appText"), radius: 0.6)
                    
                    
                    Image(systemName: "mappin")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .offset(y: -50)
                        .frame(width: 100)
                        .scaleEffect(animate ? 1 : 0.8)
                        .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: animate)
                        .shadow(color: .black.opacity(0.4), radius: 20)
                }
                .padding(.bottom)
            }
//            .padding()
            .frame(height: 200)
            .background(RoundedRectangle(cornerRadius: 70)
                .fill(.ultraThickMaterial)
                .overlay(RoundedRectangle(cornerRadius: 70)
                    .stroke(.primary.opacity(0.3), lineWidth: 3)))
            .foregroundColor(Color("appButton"))
            .shadow(color: .black.opacity(0.3), radius: 20)
            .padding(.horizontal)
            .task {
                animate = true
            }
        }
    }
}
