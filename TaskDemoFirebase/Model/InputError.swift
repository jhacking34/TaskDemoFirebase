//
//  InputError.swift
//  TaskDemoFirebase
//
//  Created by Johnny Hacking on 4/3/22.
//

import Foundation

enum InputError: Error{
    case empty
}

enum FilterChoice {
    case isTrue
    case isFalse
    case all
}
