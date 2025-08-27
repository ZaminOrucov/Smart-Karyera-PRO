//
//  OzunumesgulluqScreen.swift
//  SmartKaryeraPRO
//
//  Created by Zamin Orucov on 8/27/25.
//

import SwiftUI

struct OzunumesgulluqScreen: View {
    
    let sections: [OzunSection] = [
        OzunSection(
            title: "Özünüməşğulluq nədir?",
            description: "Özünüməşğulluq proqramı vətəndaşların kiçik ailə təsərrüfatı və biznes fəaliyyəti qurmasına dəstək olur.",
            icon: "person.2.fill",
            color: .blue
        ),
        OzunSection(
            title: "Əmlakla təmin olunan vətəndaşların siyahısı",
            description: "Proqram üzrə aktivlərlə təmin olunmuş şəxslərin siyahısı.",
            icon: "list.bullet.rectangle.fill",
            color: .green
        ),
        OzunSection(
            title: "Növbəlilik reyestri",
            description: "Hazırda proqram üzrə növbədə olan vətəndaşların reyestri.",
            icon: "clock.fill",
            color: .orange
        ),
        OzunSection(
            title: "Aktivlər və zərflər",
            description: "Mövcud zərflərlə tanış olun və detalları öyrənin.",
            icon: "archivebox.fill",
            color: .purple,
            isSpecial: true
        )
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(sections) { section in
                        if section.isSpecial {
                            NavigationLink(destination: ZarflarView()) {
                                SectionCardOzun(section: section)
                            }
                        } else {
                            NavigationLink(destination: OzunDetailScreen(section: section)) {
                                SectionCardOzun(section: section)
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Özünüməşğulluq")
        }
    }
}

// 🔹 Model
struct OzunSection: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let icon: String
    let color: Color
    var isSpecial: Bool = false
}

// 🔹 Kart
struct SectionCardOzun: View {
    let section: OzunSection
    
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

// 🔹 Ətraflı səhifə (normal bölmələr üçün)
struct OzunDetailScreen: View {
    let section: OzunSection
    
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

// 🔹 Zərflərin siyahısı
//struct ZarfListScreen: View {
//    let zarflar = [
//        Zarf(name: "Kənd təsərrüfatı zərfi", description: "Heyvandarlıq, arıçılıq və digər kənd təsərrüfatı istiqamətləri."),
//        Zarf(name: "Xidmət zərfi", description: "Çayxana, gözəllik salonu, kiçik xidmət sahələri."),
//        Zarf(name: "Ticarət zərfi", description: "Kiçik market və satış obyektləri üçün nəzərdə tutulmuşdur."),
//        Zarf(name: "İstehsal zərfi", description: "Qida istehsalı, tikiş sexi və digər istehsal fəaliyyətləri.")
//    ]
//    
//    var body: some View {
//        List(zarflar) { zarf in
//            NavigationLink(destination: ZarfDetailScreen(zarf: zarf)) {
//                Text(zarf.name)
//            }
//        }
//        .navigationTitle("Zərflər")
//    }
//}
//
//// 🔹 Zərf modeli
//struct Zarf: Identifiable {
//    let id = UUID()
//    let name: String
//    let description: String
//}
//
//// 🔹 Zərf detalları
//struct ZarfDetailScreen: View {
//    let zarf: Zarf
//    
//    var body: some View {
//        VStack(spacing: 20) {
//            Text(zarf.name)
//                .font(.title)
//                .bold()
//            
//            Text(zarf.description)
//                .font(.body)
//                .foregroundColor(.secondary)
//                .padding()
//            
//            Spacer()
//        }
//        .padding()
//        .navigationTitle("Zərf haqqında")
//    }
//}

// Zərf modeli


struct Zarf: Identifiable {
    let id = UUID()
    let ad: String
    let icon: String
    let reng: Color
}

struct Kateqoriya: Identifiable {
    let id = UUID()
    let ad: String
    let reng: Color
    let icon: String
    let zarflar: [Zarf]
}

struct ZarflarView: View {
    
    let kateqoriyalar: [Kateqoriya] = [
        Kateqoriya(
            ad: "Kənd təsərrüfatı və heyvandarlıq",
            reng: .green,
            icon: "leaf.fill",
            zarflar: [
                Zarf(ad: "Maldarlıq", icon: "cow.fill", reng: .green),
                Zarf(ad: "Qoyunçuluq", icon: "hare.fill", reng: .mint),
                Zarf(ad: "Keçiçilik təsərrüfatı", icon: "tortoise.fill", reng: .teal),
                Zarf(ad: "Arıçılıq təsərrüfatı", icon: "drop.fill", reng: .yellow),
                Zarf(ad: "Aqroturizm", icon: "tree.fill", reng: .brown)
            ]
        ),
        Kateqoriya(
            ad: "İstehsalat və kiçik sənaye",
            reng: .blue,
            icon: "hammer.fill",
            zarflar: [
                Zarf(ad: "Un məmulatları istehsalı", icon: "bag.fill", reng: .orange),
                Zarf(ad: "PVC qapı və pəncərə", icon: "square.fill", reng: .blue),
                Zarf(ad: "Dərzi sexi", icon: "scissors", reng: .purple),
                Zarf(ad: "Dülgər sexi", icon: "hammer.fill", reng: .indigo),
                Zarf(ad: "Ayaqqabı istehsalı", icon: "shoeprints.fill", reng: .brown)
            ]
        ),
        Kateqoriya(
            ad: "Xidmət sahələri",
            reng: .orange,
            icon: "wrench.and.screwdriver.fill",
            zarflar: [
                Zarf(ad: "Kişi bərbərxanası", icon: "person.fill", reng: .blue),
                Zarf(ad: "Qadın salonu", icon: "figure.walk", reng: .pink),
                Zarf(ad: "Avtoyağlama", icon: "car.fill", reng: .gray),
                Zarf(ad: "Avtotəmizləmə", icon: "drop.circle.fill", reng: .teal),
                Zarf(ad: "Çatdırılma xidməti", icon: "bicycle", reng: .green)
            ]
        ),
        Kateqoriya(
            ad: "Yeni əlavə olunan sahələr (2025)",
            reng: .pink,
            icon: "sparkles",
            zarflar: [
                Zarf(ad: "Qəssab dükanı", icon: "cart.fill", reng: .red),
                Zarf(ad: "Kotançılıq xidməti", icon: "leaf.circle.fill", reng: .green),
                Zarf(ad: "Özünəxidmət avtoyuma", icon: "drop.triangle.fill", reng: .blue),
                Zarf(ad: "PDR xidməti", icon: "wrench.adjustable.fill", reng: .orange)
            ]
        )
    ]
    
    let cardWidth: CGFloat = 150
    let cardHeight: CGFloat = 150
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 25) {
                    ForEach(kateqoriyalar) { kateqoriya in
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: kateqoriya.icon)
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .background(kateqoriya.reng)
                                    .clipShape(Circle())
                                
                                Text(kateqoriya.ad)
                                    .font(.headline)
                                    .foregroundColor(kateqoriya.reng)
                            }
                            
                            LazyVGrid(columns: [GridItem(.fixed(cardWidth)), GridItem(.fixed(cardWidth))], spacing: 20) {
                                ForEach(kateqoriya.zarflar) { zarf in
                                    NavigationLink(destination: ZarfDetailView(zarf: zarf)) {
                                        VStack(spacing: 10) {
                                            Image(systemName: zarf.icon)
                                                .font(.system(size: 40))
                                                .foregroundColor(.white)
                                                .padding()
                                                .background(zarf.reng)
                                                .clipShape(Circle())
                                            
                                            Text(zarf.ad)
                                                .font(.subheadline)
                                                .multilineTextAlignment(.center)
                                                .foregroundColor(.primary)
                                                .lineLimit(3)
                                        }
                                        .frame(width: cardWidth, height: cardHeight)
                                        .background(Color.white)
                                        .cornerRadius(15)
                                        .shadow(color: .gray.opacity(0.3), radius: 5, x: 2, y: 3)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Özünüməşğulluq Zərfləri")
        }
    }
}

struct ZarfDetailView: View {
    let zarf: Zarf
    
    var body: some View {
        VStack(spacing: 25) {
            Image(systemName: zarf.icon)
                .font(.system(size: 80))
                .foregroundColor(.white)
                .padding()
                .background(zarf.reng)
                .clipShape(Circle())
            
            Text(zarf.ad)
                .font(.title)
                .bold()
            
            Text("Bu zərf haqqında ətraflı məlumat burada göstəriləcək. Burada təsərrüfatın və ya xidmətin məzmunu, dəstək mexanizmi və şərtlər barədə məlumat veriləcək.")
                .multilineTextAlignment(.center)
                .padding()
        }
        .padding()
    }
}

#Preview {
    OzunumesgulluqScreen()
}
