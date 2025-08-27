//
//  SignUpView.swift
//  SmartKaryeraPRO
//
//  Created by Zamin Orucov on 8/26/25.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.blue, Color.white],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Qeydiyyat")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                
                Group {
                    TextField("Adınız", text: $name)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    SecureField("Şifrə", text: $password)
                    SecureField("Şifrəni təsdiqlə", text: $confirmPassword)
                }
                .padding()
                .background(Color.white.opacity(0.9))
                .cornerRadius(12)
                
                Button("Qeydiyyatdan keç") {
                    // sign up action
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .cornerRadius(12)
                .shadow(radius: 5)
                
                Button("Bağla") {
                    presentationMode.wrappedValue.dismiss()
                }
                .foregroundColor(.blue)
                .padding(.top, 10)
            }
            .padding(.horizontal, UIDevice.current.userInterfaceIdiom == .pad ? 200 : 30)
        }
    }
}

#Preview {
    SignUpView()
}
