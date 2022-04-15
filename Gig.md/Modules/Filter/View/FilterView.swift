//
//  FilterView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 14.04.2022.
//

import SwiftUI

struct FilterView: View {
    var body: some View {
        
        ZStack {
            Color("darkPink").opacity(0.9)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Worker Filters")
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                VStack (alignment: .leading, spacing: 20){
                    Text("Skill Category")
                        .bold()
                        .foregroundColor(.white)
                    DropDown()
                    Text("Worker Location")
                        .bold()
                        .foregroundColor(.white)
                    DropDown()
                    Text("Worker Gender")
                        .bold()
                        .foregroundColor(.white)
                    DropDown()
                    
                }
            }
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
