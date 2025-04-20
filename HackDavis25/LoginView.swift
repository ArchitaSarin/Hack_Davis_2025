//
//  LoginView.swift
//  HackDavis25
//
//  Created by Manushri Rane on 4/19/25.
//


import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var autoSignIn: Bool = true
    @State private var isLoggedIn = false
    let blueCol = Color(red: 0.53, green: 0.70, blue: 0.93)
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()
                
                /**Rectangle()
                    .fill(Color(red: 0.25, green: 0.4, blue: 0.7))
                    .frame(width: 250, height: 120)
                    .overlay(Text("logo").font(.title).bold())
                **/
                
                Image(.passportsimg)
                    .frame(width: 250, height: 120)
                
                Text("Sign In")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                
                
                HStack {
                    Image(.icBaselineEmail)
                        .foregroundColor(Color(red: 0.25, green: 0.4, blue: 0.7))
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .foregroundColor(Color(red: 0.25, green: 0.4, blue: 0.7))
                        .frame(width: 250, height: 18)
                    
                    
                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .foregroundColor(Color(red: 0.25, green: 0.4, blue: 0.7))
                
                
                HStack {
                    Image(.oouiUnLock)
                    SecureField("Password", text: $password)
                        .frame(width: 250, height: 18)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .foregroundColor(Color(red: 0.25, green: 0.4, blue: 0.7))
                
                
                HStack {
                    Toggle(isOn: $autoSignIn) {
                        Text("Auto Sign In")
                            .foregroundColor(.white)
                        
                    }
                    .padding(.leading, 20)
                    .toggleStyle(CheckboxToggleStyle())
                    
                    Spacer()
                    
                    Button("Forgot Password?") {
                        // would still ask
                    }
                    .foregroundColor(.white)
                    .font(.subheadline)
                }
                .padding(.horizontal)
                
                Button(action: {
                    isLoggedIn = true
                }) {
                    Text("Sign In")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal, 50)
                        .padding(.vertical, 12)
                        .background(Color.white)
                        .foregroundColor(Color(red: 0.17, green: 0.34, blue: 0.56))
                        .cornerRadius(30)
                }
                .padding(.top)
                
                // Register text
                HStack(spacing: 4) {
                    Text("Or")
                        .foregroundColor(.white)
                    Button("Register") {
                        // Handle register
                    }
                    .foregroundColor(.white)
                    .bold()
                }
                
                Divider()
                    .background(Color.white)
                    .padding(.horizontal)
                
                // Sign In with Google
                VStack(spacing: 10) {
                    Text("Sign In With")
                        .foregroundColor(.white)
                    
                    //Image(systemName: "g.circle.fill")
                    Image(.vector)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                }
                
                Spacer()
            }
            .padding()
            .background(Color(red: 0.25, green: 0.4, blue: 0.7).edgesIgnoringSafeArea(.all))
            .navigationDestination(isPresented: $isLoggedIn) {
                Questionnaire()
            }
        }
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .foregroundColor(.white)
                configuration.label
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .background(Color(red: 0.25, green: 0.4, blue: 0.7))
            .environment(\.colorScheme, .dark)
    }
}

