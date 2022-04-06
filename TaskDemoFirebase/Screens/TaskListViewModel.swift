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
    @Published var taskCellViewModels = [TaskCellViewModel]() // array of our task View Models
    @Published var filteredData = [TaskCellViewModel]()
    let apiService = LocalApiService()
    private var cancellable: AnyCancellable?
    @Published var filterChoic : FilterChoice = .isFalse
    
    
    init(){
        let localData = apiService.loadJsonData()
        self.taskCellViewModels = localData.tasks.map { task in
                TaskCellViewModel(localtask: task)
        }
        filterData(criteria: .all)
    }
    
    func filterData(criteria: FilterChoice){
        filteredData = []
        print("this is how many \(taskCellViewModels.count)")
        cancellable = taskCellViewModels.publisher.filter { task in
            switch criteria {
            case .isTrue:
                return task.task.completed == true
            case .isFalse:
                return task.task.completed == false
            case .all:
                return task.task.completed == true 
            }
            
        }
        .sink { [unowned self] datum in
            filteredData.append(datum)
        }
        
    }
    
    func removeTask(_ atLocation: IndexSet){
        taskCellViewModels.remove(atOffsets: atLocation)
    }
    
    func addNewTask(newTask: Task){
        taskCellViewModels.append(TaskCellViewModel(localtask: newTask))
        filterData(criteria: self.filterChoic)
    }
    
}
