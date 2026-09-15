import SwiftUI

struct Message: Identifiable, Equatable {
    let id = UUID()
    let text: String
    let isUser: Bool
}

struct CareerChatView: View {
    @State private var messages: [Message] = [
        Message(text: "Salam! Mənimlə karyera barədə suallarınızı paylaşa bilərsiniz 🚀", isUser: false)
    ]
    @State private var currentInput: String = ""

    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 12) {
                        ForEach(messages) { message in
                            HStack {
                                if message.isUser { Spacer() }
                                Text(message.text)
                                    .padding()
                                    .background(message.isUser ? Color.blue.opacity(0.8) : Color.gray.opacity(0.2))
                                    .foregroundColor(message.isUser ? .white : .black)
                                    .cornerRadius(16)
                                    .frame(maxWidth: UIScreen.main.bounds.width * 0.7, alignment: message.isUser ? .trailing : .leading)
                                if !message.isUser { Spacer() }
                            }
                            .id(message.id)
                        }
                    }
                    .padding()
                }
                .onChange(of: messages) { _, _ in
                    if let lastId = messages.last?.id {
                        withAnimation {
                            proxy.scrollTo(lastId, anchor: .bottom)
                        }
                    }
                }
            }

            Divider()

            HStack {
                TextField("Mesaj yazın...", text: $currentInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.leading, 8)

                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Circle())
                }
            }
            .padding()
        }
        .navigationTitle("Karyera Chat")
    }

    func sendMessage() {
        let trimmedInput = currentInput.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedInput.isEmpty else { return }

        let userMessage = Message(text: trimmedInput, isUser: true)
        messages.append(userMessage)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            let reply = generateReply(for: trimmedInput)
            messages.append(Message(text: reply, isUser: false))
        }

        currentInput = ""
    }

    func generateReply(for input: String) -> String {
        let cleaned = input
            .lowercased()
            .trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Sözlərə bölürük, vergül, nida işarəsi və s. çıxır
        let words = cleaned.components(separatedBy: CharacterSet.alphanumerics.inverted)

        var responses: [String] = []

        if words.contains("salam") {
            responses.append("Salam! Necə kömək edə bilərəm?")
        }
        if words.contains("iş") {
            responses.append("Hazırda Dövlət Məşğulluq Agentliyi tərəfindən müxtəlif vakansiyalar təklif olunur. Hansı sahə üzrə iş axtarırsınız?")
        }
        if words.contains("təlim") || words.contains("kurs") {
            responses.append("Peşə hazırlığı kursları üçün müraciət edə bilərsiniz. Ən yaxın filialımıza müraciət edin ✅")
        }
        if words.contains("Özünüməşğulluq proqramı") {
            responses.append("Hazırda Dövlət Məşğulluq Agentliyi tərəfindən bu proqram üçün müraciət edən vətəndaşlar müxtəlif aktiv və zərflərlə təmin olunr")
        }
        return responses.isEmpty ? "Bağışlayın, sizi anlamadım 🙏" : responses.joined(separator: " ")
    }
}

#Preview {
    CareerChatView()
}
