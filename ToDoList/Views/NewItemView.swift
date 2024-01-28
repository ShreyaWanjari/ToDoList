//
//  NewItemView.swift
//  ToDoList
//
//  Created by Shreya Wanjari on 26/01/24.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented : Bool
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top , 100)
            
            Form{
                //title
                TextField("Title",text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //due date
                DatePicker("Due date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //btn
                TLButton(title: "Save", backgrounC: .pink){
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    }else{
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }.alert(isPresented: $viewModel.showAlert, content: {
                Alert(
                    title: Text("Error"),
                    message: Text("Please fill in all the fields and select due date that is today or newer ."))
            })
        }
    }
}
#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    },set: { _ in
         
    }))
}
