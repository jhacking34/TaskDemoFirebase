//
//  TaskListView.swift
//  TaskDemoFirebase
//
//  Created by Johnny Hacking on 4/2/22.
//

import SwiftUI

struct TaskListView: View {
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
                    Text("Select Category")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color.brandForeground)
                        .padding(.vertical, 20)
                    
                    Image(systemName: "person.3.fill")
                        .deepShadow()
                        .foregroundColor(Color.brandForegroundStandard)
                        .font(.system(size: 95, weight: .semibold, design: .rounded))
                        .padding(.bottom, 38)
                    
                    Text("Add or edit list below")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.brandForeground)
                        .padding(.bottom, 80)
                    
                    List{
                        ListRowItem(imgName: "person.circle", rowText: "John Smith")
                        ListRowItem(imgName: "person.circle", rowText: "Terry Newman")
                        ListRowItem(imgName: "person.circle", rowText: "Mark Butters")
                        ListRowItem(imgName: "person.circle", rowText: "Lance Hill")
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

struct ListRowItem: View {
    
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
        .listRowBackground(Color.brandTertiary)
    }
}
