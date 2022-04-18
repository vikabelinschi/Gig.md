//
//  WorkersListView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 05.04.2022.
//

import SwiftUI

struct WorkersListView: View {
    var workers: [WorkerModel]
    @State var worker: WorkerModel?
    @State var workerTapped: Bool = false
    var screen = UIScreen.main.bounds
    var body: some View {
        ScrollView {
            if workerTapped {
                if let worker = worker {

                    DetailPageView(worker: worker)
                        .frame(width: screen.width - 60)
                   // .transition(.move(edge: .leading))
                }
            }
            VStack {
                ForEach(workers, id: \.self) { worker in
                    WorkerRowView(worker: worker)
                        .onTapGesture {
                            withAnimation {
                                self.worker = worker
                                self.workerTapped.toggle()
                            }
//                            DetailPageView(worker: worker)
                        }
                }
                .padding(9)
            }
        }
//        .sheet(item: $worker) { item in
//            DetailPageView(worker: item)
//        }
    }
}

struct WorkersListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkersListView(workers: workers)
    }
}
