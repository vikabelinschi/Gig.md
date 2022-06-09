//
//  DropDown.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 14.04.2022.
//

import SwiftUI

struct DropDown: View {
    @State var value = "Menu"
    var screen = UIScreen.main.bounds
    @State var expand: Bool = false
    var categories: [String] = jobCategories
    var placeholder = "Select Client"
    var dropDownList = ["PSO", "PFA", "AIR", "HOT"]
    var body: some View {
     //   VStack {
        //    Spacer()
            VStack(spacing: 30) {
                HStack {
                    Button(action: {
                        withAnimation {
                            self.expand.toggle()
                        }
                    }, label: {
                        Text(value)
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: expand ? "chevron.up" : "chevron.down")
                            .resizable()
                            .frame(width: 13, height: 6)
                            .foregroundColor(.white)
                    })
                }
                .frame(width: screen.width/1.3)
              //  ScrollView {
                if expand {
                    ScrollView {
                        VStack {
                    ForEach(categories, id: \.self) {
                        category in
                            Button() {
                                self.expand.toggle()
                                self.value = category
                            } label: {
                                Text(category)
                                    .foregroundColor(.white)
                                Spacer()
                       }
                            .padding(3)
                      }
                    }
                    }.frame(width: screen.width/1.3, height: screen.height/7)
//                    Button {
//                        print("1")
//                        self.expand.toggle()
//                    } label: {
//                        Text("Profile")
//                            .foregroundColor(.white)
//                    }
//                    Button {
//                        print("2")
//                        self.expand.toggle()
//                    } label: {
//                        Text("Profile2")
//                            .foregroundColor(.white)
//                    }
               }
            } .padding()
            .background(.white.opacity(0.2))
                .cornerRadius(5)
    //   }
   }
}

struct DropDown_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            DropDown()
        }
    }
}
