//
//  TaskCellViewModel.swift
//  TaskDemoFirebase
//
//  Created by Johnny Hacking on 4/3/22.
//

import Foundation
import Combine

class TaskCellViewModel: ObservableObject, Identifiable {
    @Published var task: Task
    @Published var completionStatusIcon = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    var id: String = ""
    
//    static func newTask() -> TaskCellViewModel {
//        TaskCellViewModel(localtask: Task(title: "", priority: .medium, completed: false))
//    }
    
    init(localtask: Task) {
        self.task = localtask
        
        $task
            .map{ $0.completed ? "checkmark.circle.fill" : "circle"}
            .assign(to: \.completionStatusIcon, on: self)
            .store(in: &cancellables)
        
        //This pipeline takes the id from the task and assigns it to the id above which is then associated to the textfield on the view
        $task
            .map{ $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
}
