//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Shreya Wanjari on 26/01/24.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel : ToDoListViewViewModel
    @FirestoreQuery  var items : [ToDoListItem]
    
    init(userId: String){
        
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos")
        
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button("Delete"){
                                viewModel.delete(id  : item.id)
                            }.tint(.red)
                        }.listStyle(PlainListStyle())
                }.navigationTitle("To Do List")
                    .toolbar{
                        Button{
                            //action
                            viewModel.ShowingNewItemView = true
                        }label: {
                            Image(systemName: "plus")
                        }
                    }.sheet(isPresented: $viewModel.ShowingNewItemView, content: {
                        NewItemView(newItemPresented: $viewModel.ShowingNewItemView)
                    })
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "yS7AQJ2S4Ogib5oWRuSxEEgFWPJ2")
}
