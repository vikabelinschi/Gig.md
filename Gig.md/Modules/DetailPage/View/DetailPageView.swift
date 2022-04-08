//
//  DetailPageView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 08.04.2022.
//

import SwiftUI

struct DetailPageView: View {
    var worker: WorkerModel
    var body: some View {
        Text(worker.firstName + "" + worker.lastName)
    }
}

struct DetailPageView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPageView(worker: worker1)
    }
}
