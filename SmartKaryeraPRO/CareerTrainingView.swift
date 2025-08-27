//
//  CareerTrainingsView.swift
//  SmartKaryera
//
//  Created by Zamin Orucov on 8/22/25.
//

import SwiftUI
import AVKit

struct Training: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let instructor: String
    let videoURL: String
    let imageName: String
}
struct CareerTrainingsView: View {
    let trainings = [
        Training(title: "CV və peşəkar profil yaratmaq",
                 description: "Peşəkar CV və profil yaradaraq iş imkanlarınızı artırın",
                 instructor: "Zamin Orucov",
                 videoURL: "https://www.radiantmediaplayer.com/media/bbb-360p.mp4",
                 imageName: "chart.bar.doc.horizontal"),
        
        Training(title: "Müsahibəyə Hazırlıq & Özünü Təqdim Etmə Bacarığı",
                 description: "Müsahibədə uğur qazanmaq üçün bacarıqlarınızı inkişaf etdirin",
                 instructor: "Aqşin Kamilli",
                 videoURL: "https://www.radiantmediaplayer.com/media/bbb-360p.mp4",
                 imageName: "person.text.rectangle"),
        
        Training(title: "Effektiv Ünsiyyət & İş Mühitində Peşə Məsuliyyəti",
                 description: "Komanda və iş mühitində daha effektiv olun",
                 instructor: "Bağdagül Cəfərova",
                 videoURL: "https://www.radiantmediaplayer.com/media/bbb-360p.mp4",
                 imageName: "briefcase.fill"),
        
        Training(title: "Emosional Zəka & Stresin İdarə Edilməsi",
                 description: "Duyğuları idarə etmə və streslə mübarizə bacarıqları",
                 instructor: "Bağdagül Cəfərova",
                 videoURL: "https://www.radiantmediaplayer.com/media/bbb-360p.mp4",
                 imageName: "briefcase.fill")
    ]
    var body: some View {
       
        List(trainings) { training in
                 NavigationLink(destination: TrainingDetailView(training: training)) {
                     HStack(spacing: 15) {
                         Image(systemName: training.imageName)
                             .font(.largeTitle)
                             .foregroundColor(.blue)
                             .frame(width: 50, height: 50)
                             .background(Color.blue.opacity(0.1))
                             .clipShape(RoundedRectangle(cornerRadius: 12))
                         
                         VStack(alignment: .leading, spacing: 6) {
                             Text(training.title)
                                 .font(.headline)
                             Text(training.description)
                                 .font(.subheadline)
                                 .foregroundColor(.secondary)
                                 .lineLimit(2)
                         }
                     }
                     .padding(.vertical, 8)
                 }
             }
             .navigationTitle("Karyera Təlimlər")
         }
     }

     struct TrainingDetailView: View {
         let training: Training
         @State private var question: String = ""
         @State private var questions: [String] = []
         
         var body: some View {
             ScrollView {
                 VStack(alignment: .leading, spacing: 20) {
                     // Video
                     if let url = URL(string: training.videoURL) {
                         VideoPlayer(player: AVPlayer(url: url))
                             .frame(height: 220)
                             .cornerRadius(12)
                             .shadow(radius: 4)
                     }
                     
                     // Təlim məlumatı
                     VStack(alignment: .leading, spacing: 8) {
                         Text(training.title)
                             .font(.title2)
                             .bold()
                         Text("Müəllim: \(training.instructor)")
                             .font(.subheadline)
                             .foregroundColor(.secondary)
                         Text(training.description)
                             .font(.body)
                             .padding(.top, 5)
                     }
                     .padding(.horizontal)
                     
                     Divider()
                     
                     // Suallar bölməsi
                     VStack(alignment: .leading, spacing: 12) {
                         Text("Sual ver")
                             .font(.headline)
                         
                         HStack {
                             TextField("Sualınızı yazın...", text: $question)
                                 .textFieldStyle(RoundedBorderTextFieldStyle())
                             
                             Button(action: {
                                 if !question.isEmpty {
                                     questions.append(question)
                                     question = ""
                                 }
                             }) {
                                 Image(systemName: "paperplane.fill")
                                     .foregroundColor(.white)
                                     .padding(10)
                                     .background(Color.blue)
                                     .clipShape(Circle())
                             }
                         }
                         
                         if !questions.isEmpty {
                             VStack(alignment: .leading, spacing: 8) {
                                 ForEach(questions, id: \.self) { q in
                                     Text("• \(q)")
                                         .padding(6)
                                         .background(Color(.systemGray6))
                                         .cornerRadius(8)
                                 }
                             }
                         }
                     }
                     .padding()
                     .background(Color(.systemGray5).opacity(0.2))
                     .cornerRadius(12)
                     .padding(.horizontal)
                     
                     Spacer()
                 }
                 .padding(.bottom, 20)
             }
             .navigationTitle(training.title)
             .navigationBarTitleDisplayMode(.inline)
         }
     }

#Preview {
    CareerTrainingsView()
}
