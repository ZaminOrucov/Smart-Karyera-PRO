//
//  EditProfileView.swift
//  SmartKaryeraPRO
//
//  Created by Zamin Orucov on 8/26/25.
//
import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name = "Zamin müəllim"
    @State private var email = "zamin@example.com"
    @State private var phone = "+994 50 123 45 67"
    @State private var workplace = "Dövlət Məşğulluq Agentliyi"
    @State private var address = "Naxçıvan MR"
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    
                    // 🔹 Profil şəkli
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .foregroundStyle(.blue)
                        .padding(.top, 20)
                    
                    // 🔹 TextFields
                    Group {
                        InputField(label: "Ad", text: $name)
                        InputField(label: "Email", text: $email, keyboard: .emailAddress)
                        InputField(label: "Telefon", text: $phone, keyboard: .phonePad)
                        InputField(label: "İş yeri", text: $workplace)
                        InputField(label: "Ünvan", text: $address)
                    }
                    .padding(.horizontal)
                    
                    // 🔹 Save button
                    Button(action: {
                        // 🔹 Save action
                        dismiss()
                    }) {
                        Text("Yadda saxla")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                LinearGradient(colors: [.blue, .brown], startPoint: .leading, endPoint: .trailing)
                            )
                            .cornerRadius(12)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    Spacer()
                }
            }
            .navigationTitle("Profili Redaktə Et")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// 🔹 Reusable Input Field
struct InputField: View {
    var label: String
    @Binding var text: String
    var keyboard: UIKeyboardType = .default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label)
                .font(.subheadline)
                .foregroundColor(.gray)
            TextField(label, text: $text)
                .keyboardType(keyboard)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
        }
    }
}


#Preview {
    EditProfileView()
}
