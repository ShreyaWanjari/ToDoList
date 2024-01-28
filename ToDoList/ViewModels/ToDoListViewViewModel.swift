//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Shreya Wanjari on 26/01/24.
// viewmodel for list of items view
//primary tab
import FirebaseFirestore
import Foundation

class ToDoListViewViewModel : ObservableObject {
    @Published var ShowingNewItemView = false
    
    private let userId : String
    init(userId : String){
        self.userId = userId
    }
    
    func delete(id : String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
