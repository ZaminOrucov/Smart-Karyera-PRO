import SwiftUI

struct CitizenData: Identifiable {
    let id = UUID()
    let adSoyadAtaAdi: String
    let faktikiunvan: String
    let muraciettarixi: String
    let muracietistiqameti: String
    let caristatus: String
}

struct ReyestrView: View {
    @State private var fin: String = ""
    @State private var result: [CitizenData]? = nil
    @State private var mesaj: String? = nil
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Özünüməşğulluq Reyestri")
                .font(.title)
                .bold()
                .foregroundColor(.primary) // adaptiv
            
            TextField("FIN daxil edin", text: $fin)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .submitLabel(.done) // Enter/Done basanda cavab gələcək
                .onSubmit {
                    yoxlaFIN()
                }
            
            Button(action: {
                yoxlaFIN()
            }) {
                Text("Yoxla")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity) // buton tam enlənir
                    .padding()
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [.blue, .purple]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(12)
                    .contentShape(Rectangle()) // bütün sahə kliklənir
            }
            .padding(.horizontal)
            
            if let mesaj = mesaj {
                Text(mesaj)
                    .foregroundColor(.red)
                    .padding()
            }
            
            if let result = result {
                VStack(spacing: 0) {
                    // Başlıqlar
                    HStack {
                        Text("Ad Soyad Ata adı").bold().frame(maxWidth: .infinity)
                        Text("Faktiki ünvan").bold().frame(maxWidth: .infinity)
                        Text("Müraciət tarixi").bold().frame(maxWidth: .infinity)
                        Text("Müraciətin istiqaməti").bold().frame(maxWidth: .infinity)
                        Text("Cari statusu").bold().frame(maxWidth: .infinity)
                    }
                    .padding()
                    .background(Color.secondary.opacity(0.2))
                    
                    Divider().background(Color.secondary)
                    
                    // Məlumatlar
                    ForEach(result) { item in
                        HStack {
                            Text(item.adSoyadAtaAdi).frame(maxWidth: .infinity)
                            Text(item.faktikiunvan).frame(maxWidth: .infinity)
                            Text(item.muraciettarixi).frame(maxWidth: .infinity)
                            Text(item.muracietistiqameti).frame(maxWidth: .infinity)
                            Text(item.caristatus).frame(maxWidth: .infinity)
                        }
                        .padding()
                        Divider().background(Color.secondary)
                    }
                }
                .background(Color(UIColor.systemBackground)) // Light/Dark adaptiv
                .cornerRadius(12)
                .shadow(radius: 4)
                .padding()
            }
            
            Spacer()
        }
        .padding(.top)
        .background(Color(UIColor.systemBackground).ignoresSafeArea())
    }
    
    private func yoxlaFIN() {
        if fin.uppercased() == "ABC1234" {
            result = [
                CitizenData(
                    adSoyadAtaAdi: "Orucov Zamin Habil",
                    faktikiunvan: "Naxçıvan",
                    muraciettarixi: "11.02.2025",
                    muracietistiqameti: "Aqro turizm",
                    caristatus: "Şəraitinə baxış keçirilməyib, növbədədir"
                )
            ]
            mesaj = nil
        } else {
            result = nil
            mesaj = "Bu vətəndaş reyestrdə mövcud deyil"
        }
    }
}

#Preview {
    Group {
        ReyestrView()
            .preferredColorScheme(.light)
        
        ReyestrView()
            .preferredColorScheme(.dark)
    }
}
