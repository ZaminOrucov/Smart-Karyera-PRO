import SwiftUI

struct CareerPortalView: View {
    let sliderIcons = ["star.fill", "briefcase.fill", "graduationcap.fill", "doc.fill", "bell.fill"]
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack(spacing: 20) {
                    TabView {
                        ForEach(sliderIcons, id: \.self) { icon in
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.blue.opacity(0.2))
                                Image(systemName: icon)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(.blue)
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                    .frame(height: 250)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    
                    // 🔹 Search bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Axtar...", text: .constant(""))
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    
                    // 🔹 Karyera bölmələri
                    NavigationView {
                        ScrollView {
                            VStack(spacing: 20) {
                                
                                NavigationLink(destination: CareerTrainingsView()) {
                                    CareerCardGradient(icon: "graduationcap.fill",
                                                       title: "Karyera Təlimlər",
                                                       description: "Peşəkar təlimlər və kurslar haqqında məlumat",
                                                       gradient: LinearGradient(colors: [Color.blue, Color.blue.opacity(0.6)], startPoint: .topLeading, endPoint: .bottomTrailing))
                                }
                                
                                NavigationLink(destination: CVBuilderScreen()) {
                                    CareerCardGradient(icon: "doc.text.fill",
                                                       title: "CV Yarat",
                                                       description: "Peşəkar CV hazırlama vasitəsi",
                                                       gradient: LinearGradient(colors: [Color.green, Color.green.opacity(0.6)], startPoint: .topLeading, endPoint: .bottomTrailing))
                                }
                                
                                NavigationLink(destination: LinksScreen()) {
                                    CareerCardGradient(icon: "link.circle.fill",
                                                       title: "Faydalı Linklər",
                                                       description: "Əlaqədar portallar və resurslar",
                                                       gradient: LinearGradient(colors: [Color.orange, Color.orange.opacity(0.6)], startPoint: .topLeading, endPoint: .bottomTrailing))
                                }
                                
                                NavigationLink(destination: NewsFeedScreen()) {
                                    CareerCardGradient(icon: "newspaper.fill",
                                                       title: "Son Xəbərlər",
                                                       description: "Karyera ilə bağlı yeniliklər",
                                                       gradient: LinearGradient(colors: [Color.red, Color.red.opacity(0.6)], startPoint: .topLeading, endPoint: .bottomTrailing))
                                }
                                
                            }
                            .padding()
                        }
                    }
                }
            }
            .navigationTitle("Karyera Portalı")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    struct CareerCardGradient: View {
        var icon: String
        var title: String
        var description: String
        var gradient: LinearGradient
        
        var body: some View {
            HStack(spacing: 15) {
                ZStack {
                    Circle()
                        .fill(Color.white.opacity(0.3))
                        .frame(width: 60, height: 40)
                    Image(systemName: icon)
                        .font(.title)
                        .foregroundColor(.white)
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                        .lineLimit(2)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding()
            .background(gradient)
            .cornerRadius(16)
            .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 4)
        }
    }
}

#Preview {
    CareerPortalView()
}
