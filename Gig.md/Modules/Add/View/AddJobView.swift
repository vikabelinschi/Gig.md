//
//  AddJobView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 05.05.2022.
//

import Foundation
import SwiftUI

struct AddJobView: View {
    @State var description: String = ""
    @State var category: String = ""
    @State var categories: [String] = []
    @State var jobName: String = ""
    @State var location: String = ""
    @State var date: Date = Date()
    @State var wage: String = ""
    @Binding var isPresented: Bool
    @ObservedObject var viewmodel = AddJobViewModel()

    
    var body: some View {
        
        if !viewmodel.showAddJob{
            FeedView(tabBarRouter: TabBarRouter())
        } else {
            VStack(spacing: 20) {
                VStack(alignment: .leading) {
                    Text("Name")
                    TextField(" Set your gig name", text: $jobName)
                        .foregroundColor(Color("darkPink"))
                        .frame(height: 40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.purple, lineWidth: 1)
                        )
                        .background(Color("darkPink").opacity(0.4))
                }
                .padding(.horizontal, 25)
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
                    Text("Category")
                    DropdownSelector(placeholder: "Choose your category", options: [        DropdownOption(key: "CHILD_CARE", value: "Child care"),
                                                                                            DropdownOption(key: "DRIVER", value: "Driver"),
                                                                                            DropdownOption(key: "COOK", value: "Cook"),
                                                                                            DropdownOption(key: "CLEANING", value: "Cleaning"),
                                                                                            DropdownOption(key: "LANGUAGES", value: "Languages"),
                                                                                            DropdownOption(key: "FINANCE", value: "Finance"),
                                                                                            DropdownOption(key: "ENTERTAINMENT", value: "Entertainment")]) { option in
                        self.category = option.key
                    }
                }
                .padding(.horizontal, 25)
                VStack(alignment: .leading) {
                    Text("Location")
                    TextField(" Write the gig location", text: $location)
                        .foregroundColor(Color("darkPink"))
                        .frame(height: 40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.purple, lineWidth: 1)
                        )
                        .background(Color("darkPink").opacity(0.4))

                }
                .padding(.horizontal, 25)
                VStack(alignment: .leading) {
                    Text("Wage")
                    TextField(" Set your gig wage", text: $wage)
                        .foregroundColor(Color("darkPink"))
                        .frame(height: 40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.purple, lineWidth: 1)
                        )
                        .background(Color("darkPink").opacity(0.4))
                }
                .padding(.horizontal, 25)
                VStack(alignment: .leading) {
                    DatePicker(
                        "Gig Date",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                        .foregroundColor(Color("darkPink"))
                        .accentColor(Color("darkPink"))
                }
                .padding(.horizontal, 25)
                Spacer()
                Button {
                    viewmodel.addJob(jobName: jobName, description: description, category: category, location: location, date: date, wage: wage)
                    isPresented = false
                } label: {
                    Text("Post your gig job")
                        .bold()
                        .padding()
                        .frame(width: UIScreen.main.bounds.width - 50)
                        .background(LinearGradient(gradient: Gradient(colors: [Color("darkBlue").opacity(0.4),Color("purple-mix").opacity(0.5), Color("p").opacity(0.5)]), startPoint: .leading, endPoint: .trailing))
                        .foregroundColor(Color("darkPink"))
                        .cornerRadius(20)
                }
            }
            .foregroundColor(Color("darkPink"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Add your gig job")
                            .font(.headline)
                            .foregroundColor(Color("darkPink"))
                    }
                }
            }
        }
    }
}

struct AddJobView_Previews: PreviewProvider {
    static var previews: some View {
        AddJobView(isPresented: .constant(true))
    }
}
