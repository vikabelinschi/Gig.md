//
//  WorkersListView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 05.04.2022.
//

import SwiftUI

struct WorkersListView: View {
    var workers: [WorkerModel]
    var body: some View {
        ScrollView {
            VStack {
                ForEach(workers, id: \.self) { worker in
                    WorkerRowView(worker: worker)
                }
                .padding(9)
            }
        }
    }
}

struct WorkersListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkersListView(workers: workers)
    }
}
