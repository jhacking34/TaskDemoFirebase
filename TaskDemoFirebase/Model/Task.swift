//
//  Task.swift
//  TaskDemoFirebase
//
//  Created by Johnny Hacking on 4/2/22.
//

import SwiftUI

enum TaskPriority {
    case high
    case medium
    case low
}

struct Task: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var priority: TaskPriority
    var completed: Bool
}

#if DEBUG
let testDataTasks = [
    Task(title: "Implement UI", priority: .medium, completed: false),
    Task(title: "Connect to Firebase", priority: .medium, completed: false),
    Task(title: "Add Flare to app", priority: .low, completed: false)
]
#endif
