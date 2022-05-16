//
//  AddJobView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 05.05.2022.
//

import SwiftUI

struct AddJobView: View {
    @State var description: String = ""
    @State var category: String = ""
    @State var categories: [String] = []
    enum FocusField: Hashable {
       case field
     }

     @FocusState private var focusedField: FocusField?

    var body: some View {
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
                    Text("Category")
                    ForEach($categories, id: \.self) { category in
                        TextField("", text: category)
                            .foregroundColor(.white)
                            .frame(height: 40)
                            .padding(.horizontal, 8)
                            .background(Color("darkPink").opacity(0.3))
                            .focused($focusedField, equals: .field)
                                     .onAppear {
                                       self.focusedField = .field
                                   }
                    }
                    Button {
                        categories.append("")
                    } label: {
                        HStack {
                            Text("+ Add new category")
                                .padding(8)
                            Spacer().frame(maxWidth:.infinity)
                        }
                        .frame(height: 40)
                        .frame(width: UIScreen.main.bounds.width - 50)
                    .background(Color("darkPink").opacity(0.3))
                    }

                }
                .padding(.horizontal, 25)
                VStack(alignment: .leading) {
                    Text("Location")
                    TextField(" Choose your Location", text: $description)
                        .foregroundColor(.white)
                        .frame(height: 40)
                        .background(Color("darkPink").opacity(0.3))
                }
                .padding(.horizontal, 25)
                VStack(alignment: .leading) {
                    Text("Date and Time")
                    TextField("Choose the date and time for the gig", text: $description)
                        .foregroundColor(.white)
                        .frame(height: 40)
                        .background(Color("darkPink").opacity(0.3))
                }
                .padding(.horizontal, 25)
                VStack(alignment: .leading) {
                    Text("Wage")
                    TextField(" Set your gig wage", text: $description)
                        .foregroundColor(.white)
                        .frame(height: 40)
                        .background(Color("darkPink").opacity(0.3))
                }
                .padding(.horizontal, 25)
                Spacer()
                Button {
                    
                } label: {
                    Text("Post your gig job")
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
                        Text("Add your gig job")
                            .font(.headline)
                            .foregroundColor(Color("darkPink"))
                    }
                }
            }
        }
    }

struct AddJobView_Previews: PreviewProvider {
    static var previews: some View {
        AddJobView()
    }
}
