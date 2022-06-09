//
//  WorkerProfileView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 17.05.2022.
//

import SwiftUI

struct WorkerProfileView: View {
    var profile: WorkerModel?
    @State private var showDetail = false
    
    var body: some View {
        if let profile = profile {
            VStack(alignment: .leading){
                HStack {
                    Text(profile.firstName)
                        .bold()
                    Text(profile.lastName)
                        .bold()
                }
                .foregroundColor(.purple)
                Text("Description")
                    .foregroundColor(.purple)
                    .font(.system(size: 15, weight: .semibold, design: .default))
                Text(profile.description)
                    .frame(width: UIScreen.main.bounds.width/1.2)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(.purple.opacity(0.6))
                    .cornerRadius(20)
                Text("Skills")
                    .foregroundColor(.purple)
                    .font(.system(size: 15, weight: .semibold, design: .default))
                HStack {
                ForEach(profile.skills, id:\.self) {
                    skill in
                    Text(skill)
                }
                }
                .frame(width: UIScreen.main.bounds.width/1.2)
                .foregroundColor(.white)
                .padding(10)
                .background(.purple.opacity(0.6))
                .cornerRadius(20)
                
            }
            .navigationTitle("Your worker profile")
        } else {
            VStack {
                Text("Oops..")
                    .foregroundColor(.purple)
            Text("It seems like you do not have your worker profile set.")
                .foregroundColor(.purple)
            NavigationLink(destination: AddSmthView(isPresented: $showDetail), isActive: $showDetail) {

                Text("Proceed to creating your worker profile")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(.purple)
                    .cornerRadius(20)
            }
            }
        }
        }
    }

struct WorkerProfileView_Previews: PreviewProvider {
    static var previews: some View {
        WorkerProfileView(profile: worker1)
    }
}
