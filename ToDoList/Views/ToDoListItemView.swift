//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Shreya Wanjari on 26/01/24.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    let item : ToDoListItem
    var body: some View {
        HStack{
            VStack(alignment : .leading){
                Text(item.title)
                    .font(.title2)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }
            Spacer()
            
            Button{
                viewModel.toggleIsDone(item  : item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }
        }
    }
}

#Preview {
    ToDoListItemView(item: .init(id: "123",
                                 title: "get biscyit",
                                 dueDate: Date().timeIntervalSince1970,
                                 createDate: Date().timeIntervalSince1970,
                                 isDone: true))
}
