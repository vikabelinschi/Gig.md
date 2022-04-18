//
//  DoubleSlider.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 18.04.2022.
//

import SwiftUI

struct DoubleSlider: View {
    @State var width : CGFloat = 0
    @State var width1: CGFloat = 40
    var totalWidth = UIScreen.main.bounds.width - 60
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            HStack {
            Text("\(Int(width))$")
                .offset(x: self.width)
                .foregroundColor(.white)
                Text("\(Int(width1))$")
                    .offset(x: self.width1)
                    .foregroundColor(.white)
            }
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.black.opacity(0.2))
                    .frame(height: 3)
                Rectangle()
                    .fill(Color.white)
                    .frame(width: self.width1 - self.width + 10, height: 3)
                    .offset(x: self.width + 10)
                HStack {
                    Circle()
                        .fill(.white)
                        .frame(width: 10)
                        .offset(x: self.width)
                        .gesture (
                            DragGesture()
                                .onChanged { (value) in
                                    
                                    if value.location.x >= 0  && value.location.x <= self.width1{
                                        self.width = value.location.x
                                    }
                                }
                        )
                    Circle()
                        .fill(.white)
                        .frame(width: 10)
                        .offset(x: self.width1)
                        .gesture(
                            DragGesture()
                                .onChanged { (value) in
                                    
                                    if value.location.x <= self.totalWidth  && value.location.x >= self.width{
                                        self.width1 = value.location.x
                                    }
                                }
                        )
                    
                }
            }
        }
        .padding()
    }
}

struct DoubleSlider_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.purple
                .edgesIgnoringSafeArea(Edge.Set.all)
            
            DoubleSlider()
        }
    }
}
