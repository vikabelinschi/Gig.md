//
//  Gig_mdApp.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 22.02.2022.
//

import SwiftUI

@main
struct Gig_mdApp: App {
    
    @StateObject var tabBarRouter = TabBarRouter()
    var body: some Scene {
        WindowGroup {
            FeedView(tabBarRouter: tabBarRouter)
        //  DoubleSlider()
        }
    }
}
