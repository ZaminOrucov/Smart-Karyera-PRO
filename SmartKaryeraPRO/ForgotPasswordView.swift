//
//  ForgotPasswordView.swift
//  SmartKaryeraPRO
//
//  Created by Zamin Orucov on 8/26/25.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var email = ""
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.blue, Color.white],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Şifrəni Bərpa Et 🔑")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                
                Text("Emailinizi daxil edin, bərpa linki göndəriləcək.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                
                TextField("Email", text: $email)
                    .padding()
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(12)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                
                Button("Göndər") {
                    // forgot password action
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .cornerRadius(12)
                .shadow(radius: 5)
                
                Button("Bağla") {
                    presentationMode.wrappedValue.dismiss()
                }
                .foregroundColor(.black)
                .padding(.top, 10)
            }
            .padding(.horizontal, UIDevice.current.userInterfaceIdiom == .pad ? 200 : 30)
        }
    }
}
#Preview {
    ForgotPasswordView()
}
