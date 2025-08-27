//
//  AboutAgencyView.swift
//  SmartKaryeraPRO
//
//  Created by Zamin Orucov on 8/26/25.
//

import SwiftUI

struct AboutAgencyView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                
                // 🔹 Logo
                Image("agency_logo") // Assets-ə əlavə edəcəyin logo
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 5)
                    .padding(.top, 20)
                
                // 🔹 Mətn
                Text(" 📌 NMR Əmək və Əhalinin Sosial Müdafiəsi Nazirliyinin tabeliyində fəaliyyət göstərən Agentlik işaxtaran və işsiz şəxslərin məşğulluğunu təmin edir, əmək bazarını təhlil edir, özünüməşğulluq və peşə hazırlığı proqramlarını həyata keçirir. Məqsəd vətəndaşların layiqli işlə təmin olunmasına dəstək vermək və məşğulluq imkanlarını genişləndirməkdir.")
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                
                Divider().padding(.horizontal)
                
                // 🔹 Sosial media icon düymələri
                HStack(spacing: 20) {
                    SocialButton(icon: "facebook", url: "https://facebook.com")
                    SocialButton(icon: "instagram", url: "https://instagram.com")
                    SocialButton(icon: "linkedin", url: "https://linkedin.com")
                    SocialButton(icon: "twiter", url: "https://twitter.com")
                }
                .padding(.bottom, 30)
            }
            .frame(maxWidth: .infinity)
        }
        .navigationTitle("Agentlik haqqında")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// 🔹 Sosial Media Button Component
struct SocialButton: View {
    var icon: String
    var url: String
    
    var body: some View {
        Button(action: {
            openURL(url)
        }) {
            Image(icon) // Assets-ə sosial media iconları əlavə et (məs: facebook.png)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .padding(8)
                .background(Color(.systemGray6))
                .clipShape(Circle())
                .shadow(radius: 2)
        }
    }
    
    func openURL(_ link: String) {
        if let url = URL(string: link) {
            UIApplication.shared.open(url)
        }
    }
}


#Preview {
    AboutAgencyView()
}
