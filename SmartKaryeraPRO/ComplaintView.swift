//
//  ComplaintView.swift
//  SmartKaryeraPRO
//
//  Created by Zamin Orucov on 8/26/25.
//

import SwiftUI


struct ComplaintView: View {
    @State private var requestType = "Ərizə"
    @State private var name = ""
    @State private var email = ""
    @State private var subject = ""
    @State private var message = ""
    
    @State private var submittedRequests: [UserRequest] = []
    
    let requestTypes = ["Ərizə", "Təklif", "Şikayət"]
    let messageLimit = 1500
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    
                    // 🔹 Seçimlər (Ərizə, Təklif, Şikayət)
                    Picker("Müraciət növü", selection: $requestType) {
                        ForEach(requestTypes, id: \.self) { type in
                            Text(type).tag(type)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                    VStack{
                        // 🔹 Ad Soyad
                        InputField(label: "Ad Soyad", text: $name)
                        // 🔹 Email
                        InputField(label: "Email", text: $email, keyboard: .emailAddress)
                        // 🔹 Başlıq
                        InputField(label: "Başlıq", text: $subject)
                    }
                    .padding()
                    // 🔹 Müraciət məzmunu
                    VStack(alignment: .leading) {
                        Text("Müraciət mətni")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        TextEditor(text: $message)
                            .frame(height: 150)
                            .padding(8)
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray.opacity(0.3))
                            )
                        
                        // 🔹 Limit göstəricisi
                        Text("\(message.count)/\(messageLimit) simvol")
                            .font(.caption)
                            .foregroundColor(message.count > messageLimit ? .red : .gray)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.horizontal)
                    
                    // 🔹 Göndər düyməsi
                    Button(action: submitRequest) {
                        Text("Göndər")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                LinearGradient(colors: [.blue, .brown],
                                               startPoint: .leading,
                                               endPoint: .trailing)
                            )
                            .cornerRadius(12)
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal)
                    .disabled(name.isEmpty || email.isEmpty || subject.isEmpty || message.isEmpty)
                    
                    // 🔹 Müraciətlərim
                    if !submittedRequests.isEmpty {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Müraciətlərim")
                                .font(.headline)
                                .padding(.top)
                            
                            ForEach(submittedRequests) { req in
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(req.type)
                                        .font(.subheadline)
                                        .bold()
                                    Text(req.subject)
                                        .font(.subheadline)
                                    Text(req.message)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                        .lineLimit(2)
                                }
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(10)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                }
            }
            .navigationTitle("Müraciət et")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    // 🔹 Submit function
    func submitRequest() {
        guard message.count <= messageLimit else { return }
        
        let newReq = UserRequest(
            type: requestType,
            name: name,
            email: email,
            subject: subject,
            message: message
        )
        
        submittedRequests.append(newReq)
        
        // Clear form
        name = ""
        email = ""
        subject = ""
        message = ""
    }
}

// 🔹 Model
struct UserRequest: Identifiable {
    let id = UUID()
    let type: String
    let name: String
    let email: String
    let subject: String
    let message: String
}

// 🔹 Reusable Input Field (öncə yazmışdıq)
struct InputField1: View {
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
        .padding(.horizontal)
    }
}


#Preview {
    ComplaintView()
}
