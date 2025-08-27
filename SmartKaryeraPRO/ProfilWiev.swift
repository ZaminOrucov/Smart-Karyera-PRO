//
//  ProfilWiev.swift
//  SmartKaryeraPRO
//
//  Created by Zamin Orucov on 8/26/25.
//
import SwiftUI

struct ProfilWiev: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    
                    // 🔹 Profil şəkli və məlumat
                    VStack(spacing: 12) {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                            .foregroundStyle(.blue)
                            .padding(.top, 20)
                        
                        Text("Zamin müəllim")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("Programmer | Data Analyst")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        NavigationLink(destination: EditProfileView())
                        {
                            Text("Profili redaktə et")
                                .font(.subheadline)
                                .padding(.horizontal, 30)
                                .padding(.vertical, 10)
                                .background(Color.blue.opacity(0.1))
                                .foregroundColor(.blue)
                                .cornerRadius(12)
                                .padding()
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white)
                            .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 4)
                    )
                    .padding(.horizontal)
                    
                    // 🔹 User info cards
                    VStack(spacing: 16) {
                        InfoCard(title: "Email", detail: "zamin@example.com", icon: "envelope.fill")
                        InfoCard(title: "Telefon", detail: "+994 50 123 45 67", icon: "phone.fill")
                        InfoCard(title: "İş yeri", detail: "Dövlət Məşğulluq Agentliyi", icon: "building.2.fill")
                        InfoCard(title: "Ünvan", detail: "Naxçıvan MR", icon: "map.fill")
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .padding(.vertical)
            }
            .navigationTitle("Profil")
        }
    }
}

// 🔹 Reusable Info Card
struct InfoCard: View {
    var title: String
    var detail: String
    var icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 44, height: 44)
                .background(Color.blue)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(detail)
                    .font(.body)
                    .fontWeight(.medium)
            }
            
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(.white)
                .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
        )
    }
}


#Preview {
    ProfilWiev()
}
