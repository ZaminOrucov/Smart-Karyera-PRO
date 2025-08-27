import SwiftUI

struct NewsFeedScreen: View {
    @State private var posts: [Post] = [
        Post(id: 1, author: "Dövlət Məşğulluq Agentliyi", time: "1 saat əvvəl", content: "Yeni peşə kursları qeydiyyata açıldı! İndi müraciət edə bilərsiniz."),
        Post(id: 2, author: "DMA Naxçıvan", time: "3 saat əvvəl", content: "Özünəməşğulluq proqramına seçilmiş şəxslərə aktivlər təqdim edildi."),
        Post(id: 3, author: "DMA Xəbərlər", time: "Dünən", content: "Əmək yarmarkası bu həftə baş tutacaq. Gələcək iştirakçılar qeydiyyatdan keçə bilərlər.")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach($posts) { $post in
                        NavigationLink(destination: PostDetailView(post: $post)) {
                            PostCard(post: $post)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
            .navigationTitle("📰 Son Xəbərlər")
        }
    }
}

// 🔹 Post Modeli
struct Post: Identifiable {
    let id: Int
    let author: String
    let time: String
    let content: String
    var likes: Int = 0
    var comments: [String] = []
}

// 🔹 Post Kartı (ilkin ekranda görsənən)
struct PostCard: View {
    @Binding var post: Post
    @State private var newComment: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Author + Time
            HStack {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.blue)
                VStack(alignment: .leading) {
                    Text(post.author).font(.headline)
                    Text(post.time).font(.caption).foregroundColor(.gray)
                }
                Spacer()
            }
            
            // Content qısa
            Text(post.content)
                .font(.body)
                .lineLimit(2)
            
            // Placeholder şəkil/icon
            Image(systemName: "photo.on.rectangle")
                .resizable()
                .scaledToFit()
                .frame(height: 120)
                .foregroundColor(.gray.opacity(0.5))
                .cornerRadius(10)
            
            // Like & Comment düymələri
            HStack {
                Button(action: { post.likes += 1 }) {
                    HStack {
                        Image(systemName: "hand.thumbsup")
                        Text("\(post.likes)")
                    }
                }
                
                Spacer()
                
                Text("💬 \(post.comments.count) şərh")
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 4)
            
            // Comment yazma hissəsi
            HStack {
                TextField("Şərh yaz...", text: $newComment)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("➤") {
                    if !newComment.isEmpty {
                        post.comments.append(newComment)
                        newComment = ""
                    }
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(16)
        .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

// 🔹 Post Detail View (tam açıqlama səhifəsi)
struct PostDetailView: View {
    @Binding var post: Post
    @State private var newComment: String = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Author info
                HStack {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.blue)
                    VStack(alignment: .leading) {
                        Text(post.author).font(.headline)
                        Text(post.time).font(.caption).foregroundColor(.gray)
                    }
                }
                
                // Full content
                Text(post.content)
                    .font(.body)
                
                Image(systemName: "photo.on.rectangle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .foregroundColor(.gray.opacity(0.5))
                    .cornerRadius(12)
                
                // Like & Comment
                HStack {
                    Button(action: { post.likes += 1 }) {
                        HStack {
                            Image(systemName: "hand.thumbsup.fill")
                            Text("Bəyən (\(post.likes))")
                        }
                    }
                    
                    Spacer()
                    
                    Text("💬 Şərhlər: \(post.comments.count)")
                        .foregroundColor(.gray)
                }
                .padding(.top, 8)
                
                Divider()
                
                // Comment list
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(post.comments, id: \.self) { comment in
                        Text("💬 \(comment)")
                            .font(.subheadline)
                            .padding(.vertical, 2)
                    }
                }
                
                // Comment input
                HStack {
                    TextField("Şərh yaz...", text: $newComment)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Göndər") {
                        if !newComment.isEmpty {
                            post.comments.append(newComment)
                            newComment = ""
                        }
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .padding()
        }
        .navigationTitle("Xəbər")
        .navigationBarTitleDisplayMode(.inline)
    }
}
