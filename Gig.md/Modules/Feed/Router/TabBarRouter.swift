//
//  TabBarRouter.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 07.04.2022.
//

import Foundation
import SwiftUI

class TabBarRouter: ObservableObject {
    
    @Published var currentPage: Page = .jobs
}

enum Page {
    case workers
    case jobs
}
