//
//  DetailPageView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 08.04.2022.
//

import SwiftUI

struct DetailPageView: View {
    var workerId: Int
    @ObservedObject var viewModel = WorkerDetailViewModel()
    @Binding var isPresented: Bool
    var body: some View {
            ZStack {
                Color("darkPink").opacity(0.3)
        
                VStack {
                    Text(viewModel.worker?.userName ?? "")
                        .padding(8)
                        .padding(.top, 30)
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Description")
                            .bold()
                        Text(viewModel.worker?.description ??  "")
                        Text("Skills")
                            .bold()
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(viewModel.worker?.skills ?? [], id: \.self) { skill in
                                Text(skill)
                            }
                        }
                        if let education = viewModel.worker?.educationDetails {
                            Text("Education")
                                .bold()
                            VStack(alignment: .leading) {
                                ForEach(education, id: \.self) {
                                    education in
                                    Text(education)
                                }
                            }
                        }
                    }
                    Button {
                        let tel = "tel://"
                        let formattedString = tel + (viewModel.worker?.phoneNumber ?? "")
                        guard let url = URL(string: formattedString) else { return }
                        UIApplication.shared.open(url)
                        withAnimation {
                            isPresented = false
                        }
                        
                    } label: {
                        Text("Get in touch with \(viewModel.worker?.userName ?? "")")
                            .foregroundColor(Color("darkPink"))
                            .padding(.horizontal, 30)
                            .padding(.vertical,10)
                            .background(.white)
                            .cornerRadius(20)
                            .padding()
                    }

                }
                .foregroundColor(.white)
                .padding()
            }
            .cornerRadius(20)
        .fixedSize(horizontal: false, vertical: true)
        .onAppear {
            viewModel.getDetailedWorker(workerId: workerId)
        }
    }
    
    
    func isSkillLast(_ skill: String) -> Bool {
        let skillCount = viewModel.worker?.skills.count
        if let index = viewModel.worker?.skills.firstIndex(of: skill) {
            if index + 1 != skillCount {
                return false
            }
        }
        return true
    }
}

struct DetailPageView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPageView(workerId: 1, isPresented: .constant(true))
    }
}
