//
//  Circle Button.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 07.04.2022.
//

import SwiftUI

struct CircleButton: View {
    var showPopUp: Bool
    var action: () -> Void
    var geometry: GeometryProxy
    var body: some View {
        Button(action: action,  label: {
                ZStack {
                     Circle()
                         .foregroundColor(.white)
                         .frame(width: geometry.size.width/7, height: geometry.size.width/7)
                         .shadow(radius: 4)
                    Image(systemName: "plus.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .rotationEffect(Angle(degrees: showPopUp ? 45 : 0))
                            .frame(width: abs((geometry.size.width/7)-6) , height: abs((geometry.size.width/7)-6))
                            .foregroundColor(Color("workers"))
            }
        })
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            CircleButton(showPopUp: false, action: {
                
            }, geometry: geometry)
    }
}
}
