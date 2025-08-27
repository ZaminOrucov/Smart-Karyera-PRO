//
//  MoreView.swift
//  SmartKaryeraPRO
//
//  Created by Zamin Orucov on 8/26/25.
//

import SwiftUI


struct MoreView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    
                    // 🔹 Profil Kartı
                    VStack(spacing: 12) {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 90, height: 90)
                            .foregroundStyle(.blue)
                            .padding(.top, 20)
                        
                        Text("Zamin Orucov")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text("Programmer | Data Analyst")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding()
                    }
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white)
                            .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 4)
                    )
                    .padding(.horizontal)
                    
                    // 🔹 Daha çox menu seçimləri
                    VStack(spacing: 16) {
                        NavigationLink(destination:ProfilWiev()){
                            MoreMenuItem(title: "Profil", icon: "person.fill")
                                .foregroundStyle(Color.black)
                        }
                        NavigationLink(destination:BranchesView()){
                            MoreMenuItem(title: "Bütün filiallar", icon: "building.2.fill")
                                .foregroundStyle(Color.black)
                        }
                        NavigationLink(destination:ComplaintView()){
                            MoreMenuItem(title: "Müraciət et", icon: "paperplane.fill")
                                .foregroundStyle(Color.black)
                        }
                        NavigationLink(destination:AboutAgencyView()){
                            MoreMenuItem(title: "Agentlik haqqında", icon: "info.circle.fill")
                                .foregroundStyle(Color.black)
                        }
                        NavigationLink(destination:SettingsView()){
                            MoreMenuItem(title: "Tənzimləmələr", icon: "gearshape.fill")
                                .foregroundStyle(Color.black)
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .padding(.vertical)
            }
        }
    }
}

// 🔹 Reusable menu item
struct MoreMenuItem: View {
    var title: String
    var icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.system(size: 22))
                .foregroundColor(.white)
                .frame(width: 44, height: 44)
                .background(Color.blue)
                .cornerRadius(10)
            
            Text(title)
                .font(.system(size: 18, weight: .medium))
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
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
    MoreView()
}
