//
//  TaskListViewModel.swift
//  TaskDemoFirebase
//
//  Created by Johnny Hacking on 4/3/22.
//

import Foundation
import Combine
import SwiftUI

class TaskListViewModel: ObservableObject{
    @Published var taskCellViewModels = [TaskCellViewModel]()
    let apiService = LocalApiService()
    
    
    init(){
        var localData = apiService.loadJsonData()
        self.taskCellViewModels = localData.tasks.map { task in
                TaskCellViewModel(localtask: task)
        }
    }
    
    func removeTask(_ atLocation: IndexSet){
        taskCellViewModels.remove(atOffsets: atLocation)
    }
    
    func addNewTask(newTask: Task){
        taskCellViewModels.append(TaskCellViewModel(localtask: newTask))
    }
    
}
