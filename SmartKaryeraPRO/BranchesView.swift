//
//  BranchesView.swift
//  SmartKaryeraPRO
//
//  Created by Zamin Orucov on 8/26/25.
//

import SwiftUI

struct BranchesView: View {
    @State private var expandedBranch: String? = nil
    let branches: [Branch] = [
        Branch(name: "Naxçıvan şəhər Sektoru", manager: "Eyvazov Elmar Həsənalı oğlu", address: "Naxçıvan şəhər, Heydər Əliyev prospekti 42A", phone: "0602554255",worktime: "9:00-18:00"),
        Branch(name: "Şərur rayon Sektoru", manager: "", address: "", phone: "",worktime: "9:00-18:00"),
        Branch(name: "Babək rayon Sektoru", manager: "", address: "", phone: "",worktime: "9:00-18:00"),
        Branch(name: "Ordubad rayon Sektoru", manager: "", address: "", phone: "",worktime: "9:00-18:00"),
        Branch(name: "Culfa rayon Sektoru", manager: "", address: "", phone: "",worktime: "9:00-18:00"),
        Branch(name: "Şahbuz rayon Sektoru", manager: "", address: "", phone: "",worktime: "9:00-18:00"),
        Branch(name: "Kəngərli rayon Sektoru", manager: "", address: "", phone: "",worktime: "9:00-18:00"),
        Branch(name: "Sədərək rayon Sektoru", manager: "", address: "", phone: "",worktime: "9:00-18:00")
    ]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 15) {
                    ForEach(branches, id: \.name) { branch in
                        BranchCard(branch: branch, isExpanded: expandedBranch == branch.name)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    expandedBranch = (expandedBranch == branch.name) ? nil : branch.name
                                }
                            }
                    }
                }
                .padding()
            }
            .navigationTitle("Bütün Filiallar")
            .background(Color(.systemGray6).edgesIgnoringSafeArea(.all))
        }
    }
}

// ==================== Branch Card ====================
struct BranchCard: View {
    let branch: Branch
    let isExpanded: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "building.2.fill")
                    .foregroundColor(.blue)
                    .font(.title2)
                Text(branch.name)
                    .font(.headline)
                    .foregroundColor(.black)
                Spacer()
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    .foregroundColor(.gray)
            }
            
            if isExpanded {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Sektor müdiri: \(branch.manager)")
                    Text("Ünvan: \(branch.address)")
                    Text("Əlaqə nömrəsi: \(branch.phone)")
                    Text("İş vaxtı: \(branch.worktime)")
                }
                .font(.subheadline)
                .foregroundColor(.gray)
                .transition(.opacity.combined(with: .slide))
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 3)
    }
}
struct Branch {
    let name: String
    let manager: String
    let address: String
    let phone: String
    let worktime: String
}

#Preview {
    BranchesView()
}
