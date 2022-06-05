//
//  WorkersListView.swift
//  Gig.md
//
//  Created by Victoria Belinschi on 05.04.2022.
//

import SwiftUI

struct WorkersListView: View {
    var workers: [WorkerListModel]
    @State var worker: WorkerListModel?
    @State var selectedWorker: WorkerListModel?
    @State var workerTapped: Bool = false
    var screen = UIScreen.main.bounds
    var body: some View {
        if !workerTapped {
            ScrollView {
                VStack {
                    ForEach(workers, id: \.self) { worker in
                        WorkerRowView(worker: worker)
                            .onTapGesture {
                                withAnimation {
                                    self.worker = worker
                                    self.workerTapped.toggle()
                                    self.selectedWorker = worker
                                }
                            }
                    }
                    .padding(9)
                }
            }
        }
        else {
            if let selectedWorker = selectedWorker {
                DetailPageView(workerId: selectedWorker.id)
                    .frame(width: screen.width - 50)
                    .onTapGesture {
                        withAnimation {
                            self.workerTapped.toggle()
                        }
                    }
            }
        }
    }
}
//}
//                    WorkerRowView(worker: worker)
//                        .onTapGesture {
//                            withAnimation {
//                                self.worker = worker
//                                self.workerTapped.toggle()
//                            }
//                        }
//                    if workerTapped && (self.selectedWorker == worker) {
//                        DetailPageView(worker: selectedWorker!)
//                            .onTapGesture {
//                                withAnimation {
//                                self.workerTapped.toggle()
//                                }
//                            }
//                        }
//                    else {
//                        WorkerRowView(worker: worker)
//                            .onTapGesture {
//                                withAnimation {
//                                    self.worker = worker
//                                    self.workerTapped.toggle()
//                                    self.selectedWorker = worker
                                //    DetailPageView(worker: selectedWorker!)
//                                    if workerTapped {
//                                        DetailPageView(worker: worker)
//                                            .frame(width: screen.width - 60)
//                                    }
//                                }
//                            }
            
//                            .sheet(isPresented: self.$workerTapped) { DetailPageView(worker: worker)
             //   }
//        .sheet(item: $worker) { item in
//            DetailPageView(worker: item)
//        }
 //   }
//}


struct WorkersListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkersListView(workers: workers1)
    }
}
