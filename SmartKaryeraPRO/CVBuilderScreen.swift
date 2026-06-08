//
//  CVBuilderScreen.swift
//  SmartKaryeraPRO
//
//  Created by Zamin Orucov on 8/27/25.
//
import SwiftUI
import PDFKit

struct CVBuilderScreen: View {
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    @State private var education: String = ""
    @State private var experience: String = ""
    @State private var skills: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Şəxsi Məlumatlar")) {
                        TextField("Ad Soyad", text: $fullName)
                        TextField("Email", text: $email)
                        TextField("Telefon", text: $phone)
                    }
                    
                    Section(header: Text("Təhsil")) {
                        TextField("Təhsiliniz (məs: Bakı Dövlət Univ.)", text: $education)
                    }
                    
                    Section(header: Text("İş Təcrübəsi")) {
                        TextField("Şirkət və vəzifə", text: $experience)
                    }
                    
                    Section(header: Text("Bacarıqlar")) {
                        TextField("Bacarıqlar (məs: Swift, SQL, Liderlik...)", text: $skills)
                    }
                }
                ScrollView {
                    CVPreview(
                        name: fullName,
                        email: email,
                        phone: phone,
                        education: education,
                        experience: experience,
                        skills: skills
                    )
                }
                .padding()
                Button(action: {
                    generatePDF(
                        name: fullName,
                        email: email,
                        phone: phone,
                        education: education,
                        experience: experience,
                        skills: skills
                    )
                }) {
                    Text("📄 PDF yüklə")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding()
            }
            .navigationTitle("CV Yarat")
        }
    }
}
struct CVPreview: View {
    var name: String
    var email: String
    var phone: String
    var education: String
    var experience: String
    var skills: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(name).font(.title).bold()
            Text("\(email) | \(phone)").font(.subheadline).foregroundColor(.gray)
            
            Divider()
            Text("🎓 Təhsil").font(.headline)
            Text(education)
            
            Divider()
            Text("💼 Təcrübə").font(.headline)
            Text(experience)
            
            Divider()
            Text("🛠 Bacarıqlar").font(.headline)
            Text(skills)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

func generatePDF(name: String, email: String, phone: String,
                 education: String, experience: String, skills: String) {
    
    let pdfMetaData = [
        kCGPDFContextCreator: "CV Builder",
        kCGPDFContextAuthor: name,
        kCGPDFContextTitle: "CV"
    ]
    let format = UIGraphicsPDFRendererFormat()
    format.documentInfo = pdfMetaData as [String: Any]
    
    let pageWidth = 8.5 * 72.0
    let pageHeight = 11 * 72.0
    let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)
    
    let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)
    let data = renderer.pdfData { context in
        context.beginPage()
        
        let titleAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24)]
        name.draw(at: CGPoint(x: 50, y: 50), withAttributes: titleAttributes)
        
        let bodyAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]
        let info = "\(email)\n\(phone)\n\nTəhsil:\n\(education)\n\nTəcrübə:\n\(experience)\n\nBacarıqlar:\n\(skills)"
        info.draw(in: CGRect(x: 50, y: 100, width: pageWidth - 100, height: pageHeight - 150),
                  withAttributes: bodyAttributes)
    }
    

    let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        .appendingPathComponent("CV.pdf")
    try? data.write(to: url)
    print("✅ PDF Yaradıldı: \(url)")
}


#Preview {
    CVBuilderScreen()
}
