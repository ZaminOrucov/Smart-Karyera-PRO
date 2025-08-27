//
//  MainScreen.swift
//  SmartKaryeraPRO
//
//  Created by Zamin Orucov on 8/27/25.
//
import SwiftUI

import SwiftUI

struct MainScreen: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    
                    // 🔹 Search + Profil
                    HStack {
                        NavigationLink(destination:ProfilWiev()) {
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                                .foregroundStyle(Color.blue)
                        }
                        
                        TextField("İş, kurs və ya proqram axtarın...", text: .constant(""))
                            .padding(10)
                            .background(Color(.systemGray6))
                            .cornerRadius(12)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
                    
                    // 🔹 10 şəkillik slider
                    TabView {
                        ForEach(1..<11) { i in
                            Image(systemName: "photo") // şəkil əvəzi
                                .resizable()
                                .scaledToFill()
                                .frame(height: 180)
                                .cornerRadius(16)
                                .padding(.horizontal)
                                .foregroundStyle(Color.blue)
                        }
                    }
                    .frame(height: 200)
                    .tabViewStyle(PageTabViewStyle())
                    
                    // 🔹 Kartlarla xidmətlər
                    VStack(spacing: 16) {
                        NavigationLink(destination:ProfilWiev()) {
                            ServiceCard(icon: "person.3.fill", title: "İşsiz və İş axtaranlar", description: "İmkanlar və dəstək")
                        }
                        NavigationLink(destination:ProfilWiev()) {
                            ServiceCard(icon: "building.2.fill", title: "İşəgötürənlər", description: "Xidmətlər və imkanlar")}
                        NavigationLink(destination:PeseKurslariScreen()) {
                            ServiceCard(icon: "graduationcap.fill", title: "Peşə kursları", description: "Peşə hazırlığı imkanları")
                        }
                        NavigationLink(destination:OzunumesgulluqScreen()) {
                            ServiceCard(icon: "briefcase.fill", title: "Özünüməşğulluq", description: "Biznes qurmaq üçün dəstək")
                        }
                        NavigationLink(destination:ProfilWiev()) {
                            ServiceCard(icon: "shield.checkerboard", title: "İşsizlikdən sığorta", description: "Sosial təminat və dəstək")
                        }
                    }
                    .padding(.horizontal)
                    
                    // 🔹 Son layihələr
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Son Layihələr")
                            .font(.title2)
                            .bold()
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(projects) { project in
                                    NavigationLink(destination: ProjectDetailView(project: project)) {
                                        ProjectCard(project: project)
                                    }
                                }
                                .padding()
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    // 🔹 Nəticələr
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Nəticələrimiz")
                            .font(.title2)
                            .bold()
                            .padding(.horizontal)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(results) { result in
                                ResultCard(result: result)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                }
                .padding(.bottom, 80)
            }
            .navigationBarHidden(true)
            .overlay(
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                     NavigationLink(destination:CareerChatView()) {
                            Image(systemName: "message.circle.fill")
                                .resizable()
                                .frame(width: 56, height: 56)
                                .foregroundColor(.blue)
                                .shadow(radius: 4)
                        }
                        .padding()
                    }
                }
            )
        }
    }
}

// 🔹 Xidmət Kartı
struct ServiceCard: View {
    let icon: String
    let title: String
    let description: String
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(Color.blue.opacity(0.2))
                    .frame(width: 60, height: 60)
                Image(systemName: icon)
                    .font(.system(size: 28))
                    .foregroundColor(.blue)
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.headline)
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .gray.opacity(0.2), radius: 5, x: 2, y: 4)
    }
}

// 🔹 Layihə Modeli
struct Project: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let icon: String
}

let projects = [
    Project(title: "Startap Dəstəyi", description: "Gənclər üçün biznes inkubator proqramı.", icon: "lightbulb.fill"),
    Project(title: "Rəqəmsal Bacarıqlar", description: "IT sahəsində peşə hazırlığı.", icon: "laptopcomputer"),
    Project(title: "Karyera Körpüsü", description: "Ali təhsilli işsiz və işaxtaran vətəndaşların işlə təmin olunma proqramı", icon: "personalhotspot")
]

// 🔹 Layihə Kartı
struct ProjectCard: View {
    let project: Project
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: project.icon)
                .resizable()
                .scaledToFit()
                .frame(height: 60)
                .foregroundColor(.blue)
                .padding(.top, 16)
            
            Text(project.title)
                .font(.headline)
                .multilineTextAlignment(.center)
            
            Spacer()
        }
        .frame(width: 160, height: 160)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .gray.opacity(0.3), radius: 6, x: 2, y: 4)
    }
}

// 🔹 Layihə Detal Səhifəsi
struct ProjectDetailView: View {
    let project: Project
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image(systemName: project.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
                    .foregroundColor(.blue)
                    .padding()
                
                Text(project.title)
                    .font(.largeTitle)
                    .bold()
                
                Text(project.description)
                    .font(.body)
                    .foregroundColor(.gray)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Layihə haqqında")
    }
}

// 🔹 Nəticə Modeli
struct Result: Identifiable {
    let id = UUID()
    let title: String
    let count: Int
    let icon: String
}

let results = [
    Result(title: "İşlə təmin olunan", count: 1240, icon: "person.crop.circle.fill"),
    Result(title: "Peşə kursları", count: 860, icon: "graduationcap.fill"),
    Result(title: "İşsizlikdən sığorta", count: 420, icon: "shield.fill"),
    Result(title: "Aktivlərlə təmin olunan", count: 310, icon: "shippingbox.fill"),
    Result(title: "Haqqı ödənilən iş", count: 540, icon: "briefcase.fill"),
    Result(title: "Kvota ilə iş", count: 150, icon: "person.2.fill"),
    Result(title: "Birgə maliyyələşmə", count: 200, icon: "dollarsign.circle.fill"),
    Result(title: "Peşəyönümlü məsləhət", count: 780, icon: "bubble.left.and.bubble.right.fill")
]

// 🔹 Nəticə Kartı
struct ResultCard: View {
    let result: Result
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: result.icon)
                .resizable()
                .scaledToFit()
                .frame(height: 40)
                .foregroundColor(.blue)
            
            Text("\(result.count)")
                .font(.title)
                .fontWeight(.bold)
            
            Text(result.title)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, minHeight: 140)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .gray.opacity(0.2), radius: 5, x: 2, y: 4)
    }
}


#Preview {
    MainScreen()
}
