//
//  MenuButtonView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 11.04.2022.
//

import SwiftUI

struct MenuButtonView: View {
    var imageName: String
    var text: String
    var body: some View {
        HStack{
            Image(systemName: imageName)
                .imageScale(.large)
            
            Text(text)
                .font(.system(size: 20, weight: .semibold, design: .default))
        }
        .foregroundColor(Color("purple-mix"))
    }
}

struct MenuButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MenuButtonView(imageName: "rectangle.portrait.and.arrow.right", text: "Sign Out")
    }
}
