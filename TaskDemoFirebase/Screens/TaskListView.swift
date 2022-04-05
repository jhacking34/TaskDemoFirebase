//
//  TaskListView.swift
//  TaskDemoFirebase
//
//  Created by Johnny Hacking on 4/2/22.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var taskListVM = TaskListViewModel()
    @State var presentAddNew = false
    
    var body: some View {
        GeometryReader{ gr in
            ZStack{
                Color.brandBackground
                    .edgesIgnoringSafeArea(.all)
                
                RoundedRectangle(cornerRadius: 100)
                    .fill(Color.brandSecondary)
                    .rotationEffect(.degrees(-50))
                    .offset(x: -gr.size.width * 0.5, y: -gr.size.height * 0.52)
                VStack{
                    ZStack{
                        Button {
                            self.presentAddNew.toggle()
                        } label: {
                            HStack{
                                Spacer()
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                Text("New Task")
                            }
                            .padding(.trailing, 10)
                            .font(.system(size: 18, weight: .semibold, design:.rounded))
                            .foregroundColor(Color.brandForegroundStandard)
                        }
                        
                    }
                    Text("Simple Stay On Task")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color.brandForeground)
                        .padding(.vertical, 20)
                    
                    Image(systemName: "checkmark.circle.fill")
                        .deepShadow()
                        .foregroundColor(Color.brandForegroundStandard)
                        .font(.system(size: 95, weight: .semibold, design: .rounded))
                        .padding(.bottom, 38)
                    
                    Text("Add, edit, or complete task below")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.brandForeground)
                        .padding(.bottom, 80)
                    
                    List{
                        ForEach (taskListVM.taskCellViewModels) { taskCellVM in
                            TaskCellView(taskCellVM: taskCellVM){ result in
                                // this is where we would call func to update the tasks
                                switch result{
                                case .success(let task):
                                    print(task)
                                case .failure(.empty):
                                    print("didn't work")
                                }
                                
                            }
                        }
                        .onDelete { indexSet in
                            taskListVM.removeTask(indexSet)
                        }
                        if self.presentAddNew{
                            TaskCellView(taskCellVM: TaskCellViewModel.newTask()) { result in
                                // this is where we would call func to save new tasks
                                switch result{
                                case .success(let task) :
                                    taskListVM.addNewTask(newTask: task)
                                case .failure(.empty) :
                                    print("Something went wrong creating task")
                                }
                                self.presentAddNew.toggle() //closed new task
                            }
                            
                        }
                    }
                    .listStyle(.plain)
                }
            }
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}


