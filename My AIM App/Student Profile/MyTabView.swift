//
//  MyTabView.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 28/10/2022.
//

import SwiftUI

enum Displayed {
    case contact, personal, course
}

struct MyTabView: View {
    @Binding var display: Displayed
    
    var body: some View {
        HStack{
            
            Button{
                withAnimation(.easeOut) {
                    display = Displayed.personal
                }
            } label: {
                Text("Personal")
                    .foregroundColor(display == Displayed.personal ? Color("appText") : Color("buttonText"))
                    .frame(width: UIScreen.main.bounds.width / (display == Displayed.personal ? 4 : 5))
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(display == Displayed.personal ? Color("appButton") : .gray))
            }
            Button{
                withAnimation(.easeOut) {
                    display = Displayed.contact
                }
            } label: {
                Text("Contact")
                    .foregroundColor(display == Displayed.contact ? Color("appText") : Color("buttonText"))
                    .frame(width: UIScreen.main.bounds.width / (display == Displayed.contact ? 4 : 5))
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(display == Displayed.contact ? Color("appButton") : .gray))
            }
            Button{
                withAnimation(.easeOut) {
                    display = Displayed.course
                }
            } label: {
                Text("Course")
                    .foregroundColor(display ==  Displayed.course ? Color("appText") : Color("buttonText"))
                    .frame(width: UIScreen.main.bounds.width / (display == Displayed.course ? 4 : 5))
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(display ==  Displayed.course ? Color("appButton") : .gray))
            }
        }
    }
    
}

//struct MyTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyTabView()
//    }
//}

struct TabButton: View {
    @State var toDisplay: Displayed
    @Binding var display: Displayed
    @State var title: String
    
    var body: some View {
        Button{
            withAnimation(.easeOut) {
                toDisplay = display
            }
        } label: {
            Text(title)
                .foregroundColor(display == toDisplay ? Color("appText") : Color("buttonText"))
                .frame(width: UIScreen.main.bounds.width / 5)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(display == toDisplay ? Color("appButton") : .gray))
        }
    }
    
}
