//
//  PlusMenuView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 07.04.2022.
//

import SwiftUI

struct PlusMenuView: View {
    
    let widthAndHeight: CGFloat
    
    var body: some View {
        HStack(spacing: 50) {
            Button(action: {
                
            }) {
                ZStack {
                    Circle()
                        .foregroundColor(Color("workers"))
                        .frame(width: widthAndHeight, height: widthAndHeight)
                    Image(systemName: "briefcase.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(15)
                        .frame(width: widthAndHeight, height: widthAndHeight)
                        .foregroundColor(.white)
                }
            }
            Button(action: {
                
            }) {
                ZStack {
                    Circle()
                        .foregroundColor(Color("workers"))
                        .frame(width: widthAndHeight, height: widthAndHeight)
                    Image(systemName: "person.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(15)
                        .frame(width: widthAndHeight, height: widthAndHeight)
                        .foregroundColor(.white)
                }
            }
        }
            .transition(.scale)
    }
}
struct PlusMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
        PlusMenuView(widthAndHeight: 40)
        }
    }
}
