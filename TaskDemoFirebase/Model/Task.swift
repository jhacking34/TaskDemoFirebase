//
//  Task.swift
//  TaskDemoFirebase
//
//  Created by Johnny Hacking on 4/2/22.
//

import SwiftUI

enum TaskPriority: String, Codable {
    case high
    case medium
    case low
}

struct Task: Codable, Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var priority: TaskPriority
    var completed: Bool
    
    enum CodingKeys: String, CodingKey{
        case title = "title"
        case priority = "priority"
        case completed = "completed"
    }
    
    func encode()-> Data? {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self) {
            return encoded
        } else {
            return nil
        }
    }
    
    static func decode(taskData: Data) -> Task? {
        let decoder = JSONDecoder()
        if let task = try? decoder.decode(Task.self, from: taskData){
            return task
        } else {
            return nil
        }
    }
}

#if DEBUG

// This is used for UI development
let testDataTasks = [
    Task(title: "Implement UI", priority: .medium, completed: true),
    Task(title: "Connect to Firebase", priority: .medium, completed: false),
    Task(title: "Add Flare to app", priority: .low, completed: false)
]
#endif

