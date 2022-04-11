//
//  JobRowView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 05.04.2022.
//

import SwiftUI

struct JobRowView: View {
    var screen = UIScreen.main.bounds
    var job: JobModel
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(job.name)
                    .font(.system(size: 24, weight: .semibold, design: .default))
                Text(job.employer)
                    .foregroundColor(.white)
            }
            Spacer()
            VStack(alignment: .trailing) {
                FavoritesButton(isOn: false, color: .white, action: {
                })
                Text(job.price)
                    .font(.system(size: 24, weight: .semibold, design: .default))
            }
        }
        .foregroundColor(.white)
        .frame(width: screen.width - 60)
        .padding(3)
        .background(Color("darkPink").opacity(0.3))
        .cornerRadius(5)
    }
}

struct JobRowView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            JobRowView(job: job1)
        }
    }
}
