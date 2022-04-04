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
}

struct Tasks: Codable, Identifiable {
    var id : Int
    var tasks : [Task]
    
}

#if DEBUG

// This is used for UI development
let testDataTasks = [
    Task(title: "Implement UI", priority: .medium, completed: true),
    Task(title: "Connect to Firebase", priority: .medium, completed: false),
    Task(title: "Add Flare to app", priority: .low, completed: false)
]
#endif

