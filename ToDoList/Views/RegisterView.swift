//
//  RegisterView.swift
//  ToDoList
//
//  Created by Shreya Wanjari on 26/01/24.
//

import SwiftUI

struct RegisterView: View {
   
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        VStack{
            //header
            HeaderView(title: "Register", subTitle: "Start organizing todos", angle: -15, bgColor: .pink)
            Form{
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(nil)
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .textInputAutocapitalization(nil)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(
                    title: "Create Account",
                    backgrounC: .blue){
                        viewModel.register()
                    //attempt registration
                    }.padding()
            }.offset(y  : -50)
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
