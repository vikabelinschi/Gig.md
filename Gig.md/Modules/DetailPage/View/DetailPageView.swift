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
        VStack {
        Text(worker.firstName + " " + worker.lastName)
                .padding(8)
            HStack {
                ForEach(worker.skills, id: \.self) { skill in
                    Text(skill)
                    if !isSkillLast(skill) {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 6, height: 6)
                    }
                    
                }
            }
                
                VStack {
                    if let education = worker.education {
                    ForEach(education, id: \.self) {
                        education in
                        Text(education ?? "")
                    }
                    }
                }
                
                //   Text(worker.education)
           //        Text(worker.certifications)
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
