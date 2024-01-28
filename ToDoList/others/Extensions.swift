//
//  Extensions.swift
//  ToDoList
//
//  Created by Shreya Wanjari on 26/01/24.
//

import Foundation

extension Encodable{
    func asDictionary() -> [String : Any]{
        guard let data = try? JSONEncoder().encode(self) else{
            return [:]//return empty dict
        }
        
        do{
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        }catch{
            return [:]
        }
    }
}
