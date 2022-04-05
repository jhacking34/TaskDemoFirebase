//
//  TaskCellView.swift
//  TaskDemoFirebase
//
//  Created by Johnny Hacking on 4/2/22.
//

import SwiftUI

struct TaskCellView: View {
    @ObservedObject var taskCellVM: TaskCellViewModel
    var onSave: (Result<Task, InputError>) -> Void = {_ in }  //This is our closure handle for when a new cell view is created. We will use this on the text field to call save new or update task fields.
    
    let imgName : String = "circle"
    
    var body: some View {
        HStack(spacing: 12){
            Image(systemName: taskCellVM.completionStatusIcon)
                .font(.largeTitle)
                .foregroundColor(Color.brandAccent)
                .padding(.leading, 50)
                .onTapGesture {
                    self.taskCellVM.task.completed.toggle()
                }
            TextField("Enter task title", text: $taskCellVM.task.title, onCommit: { // right here wea are using on onSave closure declared above.
                if !self.taskCellVM.task.title.isEmpty{
                    self.onSave(.success(self.taskCellVM.task))  // if is a task we set it to the task variable in the associated VM which uses the combine pipeline to associated id and stuff with task.
                } else {
                    self.onSave(.failure(.empty))
                }
                
            })
                .id(taskCellVM.id) //This binds the id from the array in the VM which is populated from the combine pipeline.
                .foregroundColor(Color.brandBackground)
                .font(.system(size: 24, weight: .semibold, design: .rounded))
                .padding(.vertical, 10)
        }
        .listRowBackground(Color.brandForeground)
    }
}

struct TaskCellView_Previews: PreviewProvider {
    static var previews: some View {
        List{
            TaskCellView(taskCellVM: TaskCellViewModel(localtask: testDataTasks[0]))
            TaskCellView(taskCellVM: TaskCellViewModel(localtask: testDataTasks[1]))
            TaskCellView(taskCellVM: TaskCellViewModel(localtask: testDataTasks[2]))
        }
        .listStyle(.automatic)
    }
}
