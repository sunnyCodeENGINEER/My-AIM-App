//
//  UserLoginTextView.swift
//  My AIM App
//
//  Created by Emmanuel Donkor on 23/10/2022.
//

import SwiftUI

struct UserLoginTextView: View {
    @State var loggedIn: Bool = false
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var studentID: String = ""
    @State private var errorMessage: String = "Enter your credentials to log in."
    
    var body: some View {
        VStack{
            Spacer()
            
            MyTextField(title: "Username", credential: $username)
            MySecureField(title: "Password", credential: $password)
            MyTextField(title: "Student ID", credential: $studentID)
                .keyboardType(.numberPad)
            
            Button{
                withAnimation(.easeInOut) {
                    loginUser(username: username, password: password, studentID: studentID)
                }
            } label: {
                Text("LOG IN".uppercased())
                    .foregroundColor(Color("appText"))
                    .fontWeight(.bold)
                    .padding()
                    .background(Color("appButton"))
                    .cornerRadius(30)
                    .overlay(RoundedRectangle(cornerRadius: 30)
                        .stroke(.black, lineWidth: 2))
            }
            .padding()
            
            Text(errorMessage)
                .font(.caption)
                .padding()
                .background(RoundedRectangle(cornerRadius: 30)
                    .fill(.thinMaterial))
                .padding(.bottom)
        }
        
    }
    
    private func loginUser(username: String, password: String, studentID: String) {
        if !username.isEmpty && !password.isEmpty && !studentID.isEmpty {
            if username == "edon" && password == "edon1" && studentID == "207" {
                loggedIn = true
                errorMessage = "Logged in successfully!"
            } else {
                errorMessage = "Please make sure your credentials are entered coirrectly."
            }
        } else {
            errorMessage = "Please fill all the fields above"
        }
    }
}

struct UserLoginTextView_Previews: PreviewProvider {
    static var previews: some View {
        UserLoginTextView()
    }
}

struct LoginBackground: View {
    private var gradient = Color("gradient")
    
    var body: some View {
        Image("loginBGIMG")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
        
        LinearGradient(colors: [gradient, gradient.opacity(0.3)], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
    }
}

struct MyTextField: View {
    @State var title: String
    @Binding var credential: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .padding(.horizontal)
            TextField("Enter your \(title)", text: $credential)
                .frame(width: UIScreen.main.bounds.width * 0.87)
                .padding()
                .background(RoundedRectangle(cornerRadius: 30)
                    .fill(.thickMaterial))
                .shadow(color: .black.opacity(0.6),radius: 15)
                .overlay(RoundedRectangle(cornerRadius: 30)
                    .stroke(.primary, lineWidth: 2))
        }
    }
}

struct MySecureField: View {
    @State var title: String
    @Binding var credential: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .padding(.horizontal)
            SecureField("Enter your \(title)", text: $credential)
                .frame(width: UIScreen.main.bounds.width * 0.87)
                .padding()
                .background(RoundedRectangle(cornerRadius: 30)
                    .fill(.thickMaterial))
                .shadow(color: .black.opacity(0.6),radius: 15)
                .overlay(RoundedRectangle(cornerRadius: 30)
                    .stroke(.primary, lineWidth: 2))
        }
    }
}
