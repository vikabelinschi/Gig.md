//
//  AddSmthView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 18.04.2022.
//

import SwiftUI

struct AddSmthView: View {
    var screen = UIScreen.main.bounds
    @State var description: String = ""
    @State var skills: [String] =  []
    @State var education: [String] = []
    @State var experience: [String] = []
    @Binding var isPresented: Bool
    @ObservedObject var viewmodel = AddWorkerViewModel()
    var body: some View {
        if !viewmodel.showAddWorker{
            FeedView(tabBarRouter: TabBarRouter())
        } else {
            ScrollView {
                VStack(spacing: 20) {
                    VStack(alignment: .leading) {
                        Text("Description")
                        TextEditor( text: $description)
                            .foregroundColor(Color("darkPink"))
                            .frame(height: 120)
                            .colorMultiply(Color("darkPink").opacity(0.4))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.purple, lineWidth: 1)
                            )
                        
                    }
                    .padding(.horizontal, 25)
                    VStack(alignment: .leading) {
                        Text("Skills")
                        ForEach(skills.indices, id:\.self) { index in
                            TextField("", text: $skills[index])
                                .foregroundColor(.white)
                                .frame(height: 40)
                                .background(Color("darkPink").opacity(0.4))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.purple, lineWidth: 1)
                                )
                        }
                        Button(action: {
                            skills.append("")
                        }) {
                            HStack {
                                Text("+ Add new skill")
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                            .frame(width: screen.width - 50, height: 40)
                            .background(Color("darkPink").opacity(0.4))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.purple, lineWidth: 1)
                            )
                        }
                    }
                    .padding(.horizontal, 25)
                    VStack(alignment: .leading) {
                        Text("Education")
                        ForEach(education.indices, id:\.self) { index in
                            TextField("", text: $education[index])
                                .foregroundColor(.white)
                                .frame(height: 40)
                                .background(Color("darkPink").opacity(0.4))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.purple, lineWidth: 1)
                                )
                        }
                        Button(action: {
                            education.append("")
                        }) {
                            HStack {
                                Text("+ Add education info")
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                            .frame(width: screen.width - 50, height: 40)
                            .background(Color("darkPink").opacity(0.4))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.purple, lineWidth: 1)
                            )
                        }
                    }
                    .padding(.horizontal, 25)
                    VStack(alignment: .leading) {
                        Text("Experience")
                        ForEach(experience.indices, id:\.self) { index in
                            TextField("", text: $experience[index])
                                .foregroundColor(.white)
                                .frame(height: 40)
                                .background(Color("darkPink").opacity(0.4))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.purple, lineWidth: 1)
                                )
                        }
                        Button(action: {
                            experience.append("")
                        }) {
                            HStack {
                                Text("+ Add experience")
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                            .frame(width: screen.width - 50, height: 40)
                            .background(Color("darkPink").opacity(0.4))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.purple, lineWidth: 1)
                            )
                        }
                    }
                    .padding(.horizontal, 25)
                    
                    
                    Spacer()
                    Button {
                        viewmodel.addWorker(skills: skills, description: description, educationDetails: education, experiences: experience)
                        isPresented = false
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
                .frame(minHeight: screen.height - 140)
            }
        }
    }
}

struct AddSmthView_Previews: PreviewProvider {
    static var previews: some View {
        AddSmthView( isPresented: .constant(true))
    }
}

//                VStack(alignment: .leading) {
//                    Text("Category")
//                    ForEach($categories, id: \.self) { category in
//                        TextField("", text: category)
//                            .foregroundColor(.white)
//                            .frame(height: 40)
//                            .padding(.horizontal, 8)
//                            .background(Color("darkPink").opacity(0.3))
//                            .focused($focusedField, equals: .field)
//                                     .onAppear {
//                                       self.focusedField = .field
//                                   }
//                    }
//                    Button {
//                        categories.append("")
//                    } label: {
//                        HStack {
//                            Text("+ Add new category")
//                                .padding(8)
//                            Spacer().frame(maxWidth:.infinity)
//                        }
//                        .frame(height: 40)
//                        .frame(width: UIScreen.main.bounds.width - 50)
//                    .background(Color("darkPink").opacity(0.3))
//                    }
//
//                }
//                .padding(.horizontal, 25)
