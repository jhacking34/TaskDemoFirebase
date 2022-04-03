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
    var taskTempData = [Task]()
    
    init(){
        loadJsonData()
        self.taskCellViewModels = taskTempData.map { task in
            TaskCellViewModel(localtask: task)
        }
    }
    
    func removeTask(_ atLocation: IndexSet){
        taskCellViewModels.remove(atOffsets: atLocation)
    }
    
    func addNewTask(newTask: Task){
        taskCellViewModels.append(TaskCellViewModel(localtask: newTask))
    }
    
    func loadJsonData(){
        let decoder = JSONDecoder()
        
        guard let sourceURL = Bundle.main.url(forResource: "taskData", withExtension: "json") else {
            fatalError("Error loading file")
        }
        
        guard let data = try? Data(contentsOf: sourceURL) else {
            fatalError("error loading data")
        }
        
        guard let taskData = try? decoder.decode(Task.self, from: data) else {
            fatalError("Data decode Error")
        }
        
        let task = Task(title: taskData.title, priority: taskData.priority, completed: taskData.completed)
        taskTempData = [task]
    }
    
}
