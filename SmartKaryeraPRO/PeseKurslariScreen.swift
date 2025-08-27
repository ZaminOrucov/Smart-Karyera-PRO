//
//  PeseKurslariScreen.swift
//  SmartKaryeraPRO
//
//  Created by Zamin Orucov on 8/27/25.
//


import SwiftUI

struct PeseKurslariScreen: View {
    
    let sections: [PeseSection] = [
        PeseSection(
            title: "Peşə hazırlığı nədir?",
            description: "Peşə hazırlığı işsiz və işaxtaran şəxslərin əmək bazarının tələblərinə uyğun ixtisaslara yiyələnməsini təmin edir.",
            icon: "questionmark.circle.fill",
            color: .blue
        ),
        PeseSection(
            title: "Peşə hazırlığı müəssisələrin reyestri",
            description: "Sertifikatlı tədris müəssisələrinin siyahısı ilə tanış olun.",
            icon: "building.columns.fill",
            color: .green
        ),
        PeseSection(
            title: "Peşə kursları",
            description: "Hazırda aktiv olan kursları izləyin və müraciət edin.",
            icon: "book.fill",
            color: .orange
        ),
        PeseSection(
            title: "Peşə hazırlığı sertifikatların reyestri",
            description: "Keçirilmiş kurslar üzrə verilmiş sertifikatların reyestri.",
            icon: "checkmark.seal.fill",
            color: .purple
        )
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(sections) { section in
                        NavigationLink(destination: SectionDetailScreen(section: section)) {
                            SectionCard(section: section)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Peşə kursları")
        }
    }
}

// 🔹 Model
struct PeseSection: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let icon: String
    let color: Color
}

// 🔹 Kart
struct SectionCard: View {
    let section: PeseSection
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: section.icon)
                .font(.system(size: 28))
                .frame(width: 50, height: 50)
                .background(section.color.opacity(0.2))
                .foregroundColor(section.color)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 6) {
                Text(section.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(section.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }
            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(16)
        .shadow(color: .gray.opacity(0.2), radius: 4, x: 2, y: 2)
    }
}

// 🔹 Ətraflı səhifə
struct SectionDetailScreen: View {
    let section: PeseSection
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: section.icon)
                .font(.system(size: 64))
                .foregroundColor(section.color)
                .padding()
            
            Text(section.title)
                .font(.title2)
                .bold()
            
            Text(section.description)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
        }
        .padding()
        .navigationTitle("Ətraflı")
    }
}


#Preview {
    PeseKurslariScreen()
}
