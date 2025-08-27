//
//  LinksScreen.swift
//  SmartKaryeraPRO
//
//  Created by Zamin Orucov on 8/27/25.
//

import SwiftUI

struct LinksScreen: View {
    // 🔹 Demo üçün linklər
    let usefulLinks: [UsefulLink] = [
        UsefulLink(title: "Dövlət Məşğulluq Agentliyi", url: "https://dma.gov.az", icon: "building.columns"),
        UsefulLink(title: "Elektron Hökumət Portalı", url: "https://www.e-gov.az", icon: "globe"),
        UsefulLink(title: "İş Elanları", url: "https://www.jobsearch.az", icon: "briefcase.fill"),
        UsefulLink(title: "Karyera Təlimləri", url: "https://udemy.com", icon: "graduationcap.fill"),
        UsefulLink(title: "LinkedIn", url: "https://linkedin.com", icon: "link")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(usefulLinks) { link in
                        NavigationLink(destination: LinkDetailScreen(link: link)) {
                            LinkCard(link: link)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Faydalı linklər")
        }
    }
}

// 🔹 Model
struct UsefulLink: Identifiable {
    let id = UUID()
    let title: String
    let url: String
    let icon: String
}

// 🔹 Kart dizaynı
struct LinkCard: View {
    let link: UsefulLink
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: link.icon)
                .font(.system(size: 28))
                .frame(width: 50, height: 50)
                .background(Color.blue.opacity(0.2))
                .foregroundColor(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 6) {
                Text(link.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(link.url)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(16)
        .shadow(color: .gray.opacity(0.2), radius: 4, x: 2, y: 2)
    }
}

// 🔹 Ətraflı baxış
struct LinkDetailScreen: View {
    let link: UsefulLink
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: link.icon)
                .font(.system(size: 64))
                .foregroundColor(.blue)
                .padding()
            
            Text(link.title)
                .font(.title2)
                .bold()
            
            Text(link.url)
                .foregroundColor(.blue)
                .underline()
                .onTapGesture {
                    if let url = URL(string: link.url) {
                        UIApplication.shared.open(url)
                    }
                }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Link detalları")
    }
}


#Preview {
    LinksScreen()
}
