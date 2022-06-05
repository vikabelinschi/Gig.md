//
//  AddSmthView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 18.04.2022.
//

import SwiftUI

struct AddSmthView: View {
    @State var description: String = ""
    @State var skills: String =  ""
    @State var education: String = ""
    @State var experience: String = ""
    @ObservedObject var viewmodel = AddWorkerViewModel()
    var body: some View {
        if !viewmodel.showAddWorker{
            FeedView(tabBarRouter: TabBarRouter())
        } else {
            VStack(spacing: 20) {
                VStack(alignment: .leading) {
                    Text("Description")
                    TextField("", text: $description)
                        .foregroundColor(.white)
                        .frame(height: 120)
                        .background(Color("darkPink").opacity(0.3))
                        .cornerRadius(20)
                    
                }
                .padding(.horizontal, 25)
                VStack(alignment: .leading) {
                    Text("Skills")
                    TextField(" + Add new skill", text: $skills)
                        .foregroundColor(.white)
                        .frame(height: 40)
                        .background(Color("darkPink").opacity(0.3))
                }
                .padding(.horizontal, 25)
                VStack(alignment: .leading) {
                    Text("Education")
                    TextField(" + Add education", text: $education)
                        .foregroundColor(.white)
                        .frame(height: 40)
                        .background(Color("darkPink").opacity(0.3))
                }
                .padding(.horizontal, 25)
                VStack(alignment: .leading) {
                    Text("Previous Experience")
                    TextField(" + Add experience", text: $experience)
                        .foregroundColor(.white)
                        .frame(height: 40)
                        .background(Color("darkPink").opacity(0.3))
                }
                .padding(.horizontal, 25)
                Spacer()
                Button {
                    viewmodel.addWorker(skills: [skills], description: description, educationDetails: [education], experiences: [experience])
                } label: {
                    Text("Post your worker profile")
                        .bold()
                        .padding()
                        .frame(width: UIScreen.main.bounds.width - 50)
                        .background(LinearGradient(gradient: Gradient(colors: [Color("darkBlue").opacity(0.4),Color("purple-mix").opacity(0.5), Color("p").opacity(0.5)]), startPoint: .leading, endPoint: .trailing))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
            }
            .foregroundColor(Color("darkPink"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Add your worker profile")
                            .font(.headline)
                            .foregroundColor(Color("darkPink"))
                    }
                }
            }
        }
        
    }
}

struct AddSmthView_Previews: PreviewProvider {
    static var previews: some View {
        AddSmthView()
    }
}
