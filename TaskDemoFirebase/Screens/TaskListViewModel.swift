//
//  TaskListViewModel.swift
//  TaskDemoFirebase
//
//  Created by Johnny Hacking on 4/3/22.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject{
    @Published var taskCellViewModels = [TaskCellViewModel]()
    
    init(){
        self.taskCellViewModels = testDataTasks.map { task in
            TaskCellViewModel(localtask: task)
        }
    }
    
    func removeTask(_ atLocation: IndexSet){
        taskCellViewModels.remove(atOffsets: atLocation)
    }
}
