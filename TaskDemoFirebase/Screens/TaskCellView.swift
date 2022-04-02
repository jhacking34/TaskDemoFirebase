//
//  TaskCellView.swift
//  TaskDemoFirebase
//
//  Created by Johnny Hacking on 4/2/22.
//

import SwiftUI

struct TaskCellView: View {
    
    let imgName : String
    let rowText : String
    
    var body: some View {
        HStack(spacing: 12){
            Image(systemName: imgName)
                .font(.largeTitle)
                .foregroundColor(Color.brandAccent)
                .padding(.leading, 50)
            Text(rowText)
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
            TaskCellView(imgName: "person.fill", rowText: "Demo Item")
        }
        .listStyle(.automatic)
    }
}
