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
            Color("darkPink")
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Worker Filters")
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                VStack (alignment: .leading, spacing: 15){
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
                    Spacer()
                    HStack(spacing: 30) {
                        Button {
                            
                        } label: {
                            Text("Clear Filters")
                        }.foregroundColor(.white)
                            .padding(15)
                            .padding(.horizontal, 15)
                            .background(Color(.gray).opacity(0.4))
                            .cornerRadius(10)
                        Button {
                            
                        } label: {
                            Text("Save Filters")
                    }
                        .foregroundColor(Color("darkPink"))
                        .padding(15)
                        .padding(.horizontal, 15)
                        .background(Color.white)
                        .cornerRadius(10)
                    }

                    
                }
                .padding(.vertical, 20)
            }
            .padding(.bottom, 30)
        }
     //   .padding(.vertical, 30)
        .cornerRadius(20)
        .fixedSize(horizontal: false, vertical: true)
       // .frame( maxHeight: 500, alignment: .center)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
