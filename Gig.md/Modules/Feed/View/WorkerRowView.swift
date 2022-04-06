//
//  WorkerRowView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 05.04.2022.
//

import SwiftUI

struct WorkerRowView: View {
    var screen = UIScreen.main.bounds
    var worker: WorkerModel
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(worker.firstName + " " + worker.lastName)
                    .font(.system(size: 24, weight: .semibold, design: .default))
                HStack{
                    ForEach(worker.skills, id: \.self) { skill in
                        Text(skill)
                        if !isSkillLast(skill) {
                            Image(systemName: "circle.fill")
                                .resizable()
                                .frame(width: 6, height: 6)
                        }
                    }
                }
            }
            Spacer()
            VStack(alignment: .trailing) {
                FavoritesButton(isOn: false, action: {
                })
            }
        }
        .foregroundColor(Color("workers"))
        .frame(width: screen.width - 60)
        .padding(3)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(.blue, lineWidth: 1)
        )
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

struct WorkerRowView_Previews: PreviewProvider {
    static var previews: some View {
        WorkerRowView(worker: worker1)
    }
}
