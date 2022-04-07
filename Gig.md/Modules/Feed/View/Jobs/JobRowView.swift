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
            }
            Spacer()
            VStack(alignment: .trailing) {
                FavoritesButton(isOn: false, action: {
                    
                })
            Text(job.price)
                .font(.system(size: 24, weight: .semibold, design: .default))
        }
            
        }
        .foregroundColor(Color("workers"))
        .frame(width: screen.width - 60)
        .padding(3)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color("workers"), lineWidth: 1)
        )
      //  .background(Color("workers"))
    }
}

struct JobRowView_Previews: PreviewProvider {
    static var previews: some View {
        JobRowView(job: job1)
    }
}
