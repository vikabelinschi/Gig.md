//
//  FavoritesButton.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 06.04.2022.
//

import SwiftUI

struct FavoritesButton: View {
    @State var isOn: Bool
    var color: Color
    
    var imageName: String {
        if isOn {
            return "heart.fill"
        } else {
            return "heart"
        }
    }
    
    var buttonColor: Color {
        if isOn {
            return .red
        } else {
            return color
        }
    }

    
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            let new = !self.isOn
            self.isOn = new
        }, label: {
            VStack {
                Image(systemName: imageName)
                    .foregroundColor(buttonColor)
            }
        })
    }
}

struct FavoritesButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            FavoritesButton(isOn: false, color: .white, action: {
                
            })
        }
    }
}
