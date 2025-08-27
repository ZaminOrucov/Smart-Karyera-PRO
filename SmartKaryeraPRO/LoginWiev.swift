//
//  LoginWiev.swift
//  SmartKaryeraPRO
//
//  Created by Zamin Orucov on 8/26/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false
    @State private var showForgotPassword = false
    @State private var showSignUp = false
    @State private var isLoggedIn = false
    
    var body: some View {
        if isLoggedIn {
            MainMenu()
        } else {
            
            ZStack {
                
                // 🔹 Gradient background
                LinearGradient(colors: [Color.blue, Color.white],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .ignoresSafeArea()
                
                VStack {
                    Spacer(minLength: 80)
                    
                    // 🔹 Card
                    VStack(spacing: 20) {
                        Text("Xoş Gəlmisiniz 👋")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        Text("Davam etmək üçün hesabınıza daxil olun")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        // 🔹 Email
                        HStack {
                            Image(systemName: "envelope.fill")
                                .foregroundColor(.gray)
                            TextField("Email", text: $email)
                                .autocapitalization(.none)
                                .keyboardType(.emailAddress)
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        
                        // 🔹 Password
                        HStack {
                            Image(systemName: "lock.fill")
                                .foregroundColor(.gray)
                            if showPassword {
                                TextField("Şifrə", text: $password)
                                    .autocapitalization(.none)
                            } else {
                                SecureField("Şifrə", text: $password)
                                    .autocapitalization(.none)
                            }
                            Button(action: { showPassword.toggle() }) {
                                Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        
                        // 🔹 Forgot password
                        HStack {
                            Spacer()
                            Button("Şifrəni bərpa et") {
                                showForgotPassword = true
                            }
                            .font(.footnote)
                            .foregroundColor(.blue)
                        }
                        
                        // 🔹 Login button
                        Button(action: {
                            withAnimation {
                                isLoggedIn = true
                            }
                        }) {
                            Text("Daxil ol")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(
                                    LinearGradient(colors: [Color.blue, Color.brown],
                                                   startPoint: .leading,
                                                   endPoint: .trailing)
                                )
                                .cornerRadius(12)
                                .shadow(radius: 5)
                                .scaleEffect(1.0)
                        }
                        
                        
                        // 🔹 Sign up
                        HStack {
                            Text("Hesabınız yoxdur?")
                            Button("Qeydiyyat") {
                                showSignUp = true
                            }
                            .foregroundColor(.blue)
                            .bold()
                        }
                        .padding(.top, 10)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .padding(.horizontal, UIDevice.current.userInterfaceIdiom == .pad ? 200 : 30)
                    
                    Spacer()
                }
            }
            .fullScreenCover(isPresented: $showSignUp) {
                SignUpView()
            }
            .fullScreenCover(isPresented: $showForgotPassword) {
                ForgotPasswordView()
            }
        }
    }
}

#Preview {
    LoginView()
}
