//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Shreya Wanjari on 26/01/24.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
class NewItemViewViewModel: ObservableObject{
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init(){}
    
    func save(){
        guard canSave else{
            return
        }
        
        //get curren user ID
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        }
        //craeate model
        let newid = UUID().uuidString
        let newItem = ToDoListItem(id: newid,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
        //save model to db
        let db  = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newid)
            .setData(newItem.asDictionary())
    }
    
    var canSave : Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            return false
        }
        return true
    }
    
    
    
}
