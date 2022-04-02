//
//  View+Ext.swift
//  TaskDemoFirebase
//
//  Created by Johnny Hacking on 4/2/22.
//

import SwiftUI

public extension View {
    func deepShadow() -> some View {
        self
            .shadow(radius: 10, y: 10)
    }
    
    func deepShadow2() -> some View {
        self
            .shadow(radius: 10, y: -10)
    }
}

struct View_Ext_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.blue)
            .deepShadow()
            .frame(width: 125, height: 125)
    }
}
