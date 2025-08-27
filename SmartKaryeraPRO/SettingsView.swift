//
//  SettingsView.swift
//  SmartKaryeraPRO
//
//  Created by Zamin Orucov on 8/26/25.
//

import SwiftUI

struct SettingsView: View {
    @State private var isDarkMode = false
    @State private var notificationsEnabled = true
    
    var body: some View {
        NavigationView {
            Form {
                
                // 🔹 Gizlilik və Güvənlik
                Section(header: Text("Gizlilik və Güvənlik")) {
                    NavigationLink(destination: ChangePasswordView()) {
                        Label("Şifrəni dəyiş", systemImage: "key.fill")
                    }
                }
                
                // 🔹 Proqram ayarları
                Section(header: Text("Proqram ayarları")) {
                    Toggle(isOn: $isDarkMode) {
                        Label("Qaranlıq mod", systemImage: "moon.fill")
                    }
                }
                
                // 🔹 Bildirimlər
                Section(header: Text("Bildirimlər")) {
                    Toggle(isOn: $notificationsEnabled) {
                        Label("Bildirimləri aktiv et", systemImage: "bell.fill")
                    }
                }
                
                // 🔹 Hesab
                Section(header: Text("Hesab")) {
                    Button(role: .destructive) {
                        // Hesabı silmə əməliyyatı
                        print("Hesab silindi")
                    } label: {
                        Label("Hesabı sil", systemImage: "trash.fill")
                    }
                    
                    Button {
                        // Hesabı dondurma əməliyyatı
                        print("Hesab donduruldu")
                    } label: {
                        Label("Hesabı dondur", systemImage: "pause.circle.fill")
                    }
                    Button {
                        exit(0)
                    } label: {
                        Label("Hesabdan çıx", systemImage: "power")
                    }
                }
            }
            .navigationTitle("Tənzimləmələr")
        }
    }
}

// 🔹 Şifrəni dəyişmək səhifəsi (sadə nümunə)
struct ChangePasswordView: View {
    @State private var oldPassword = ""
    @State private var newPassword = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        Form {
            Section(header: Text("Şifrəni dəyiş")) {
                SecureField("Köhnə şifrə", text: $oldPassword)
                SecureField("Yeni şifrə", text: $newPassword)
                SecureField("Yeni şifrəni təsdiqlə", text: $confirmPassword)
                
                Button("Yadda saxla") {
                    // Şifrə dəyişmə əməliyyatı
                    print("Şifrə dəyişdirildi")
                }
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(12)
            }
        }
        .navigationTitle("Şifrəni dəyiş")
    }
}

#Preview {
    SettingsView()
}
