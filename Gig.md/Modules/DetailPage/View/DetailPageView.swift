//
//  DetailPageView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 08.04.2022.
//

import SwiftUI

struct DetailPageView: View {
    var worker: WorkerModel
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.white)
                .frame(width: 80)
                .offset(y: -220)
                .zIndex(5)
            Image("1")
//                .resizable()
//                .frame(width: 70, height: 40)
//                .zIndex(6)
//                .clipShape(Circle())
//                .resizable()
//                .foregroundColor(.white)
//                .padding(20)
//                .zIndex(6)
//                .clipShape(Circle())
//                .aspectRatio(contentMode: .fill)
//                .frame(width: 75, height: 75)
//                .offset(y: -220)
                .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 150)
                        .offset(y: -220)
                        .zIndex(6)
            
            ZStack {
                Color("darkPink").opacity(0.3)
    //            Circle()
    //                .foregroundColor(.white)
    //                .offset(x: )
        
                VStack {
                    Text(worker.firstName + " " + worker.lastName)
                        .padding(8)
                        .padding(.top, 30)
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Description")
                            .bold()
                        Text(worker.description)
                        Text("Skills")
                            .bold()
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(worker.skills, id: \.self) { skill in
                                Text(skill)
                            }
                        }
                        if let education = worker.education {
                            Text("Education")
                                .bold()
                            VStack {
                                ForEach(education, id: \.self) {
                                    education in
                                    Text(education ?? "")
                                }
                            }
                        }
                    }
                }
                .foregroundColor(.white)
                .padding()
            }
            .cornerRadius(20)
        .fixedSize(horizontal: false, vertical: true)
        }
    }
    
    func isSkillLast(_ skill: String) -> Bool {
        let skillCount = worker.skills.count
        if let index = worker.skills.firstIndex(of: skill) {
            if index + 1 != skillCount {
                return false
            }
        }
        return true
    }
}

struct DetailPageView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPageView(worker: worker1)
    }
}
