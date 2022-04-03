//
//  TaskCellView.swift
//  TaskDemoFirebase
//
//  Created by Johnny Hacking on 4/2/22.
//

import SwiftUI

struct TaskCellView: View {
    @ObservedObject var taskCellVM: TaskCellViewModel
    
    let imgName : String
    
    var body: some View {
        HStack(spacing: 12){
            Image(systemName: imgName)
                .font(.largeTitle)
                .foregroundColor(Color.brandAccent)
                .padding(.leading, 50)
            TextField("Enter task title", text: $taskCellVM.task.title)
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
            TaskCellView(taskCellVM: TaskCellViewModel(localtask: testDataTasks[0]), imgName: "circle")
            TaskCellView(taskCellVM: TaskCellViewModel(localtask: testDataTasks[1]), imgName: "circle")
            TaskCellView(taskCellVM: TaskCellViewModel(localtask: testDataTasks[2]), imgName: "circle")
        }
        .listStyle(.automatic)
    }
}
