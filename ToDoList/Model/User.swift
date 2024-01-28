//
//  User.swift
//  ToDoList
//
//  Created by Shreya Wanjari on 26/01/24.
//

import Foundation

struct User : Codable{
    let id :  String
    let name  : String
    let email  : String
    let joined : TimeInterval
}
