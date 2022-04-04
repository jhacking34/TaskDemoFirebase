//
//  LocalApiService.swift
//  TaskDemoFirebase
//
//  Created by Johnny Hacking on 4/4/22.
//

import Foundation

class LocalApiService {
    
    
    func loadJsonData() -> [Task]{
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
        return [task]
    }
}
