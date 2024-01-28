//
//  LoginView.swift
//  ToDoList
//
//  Created by Shreya Wanjari on 26/01/24.
//

import SwiftUI

struct LoginView: View {
    
 @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                //Header
                HeaderView(title: "To Do List", subTitle: "Get things done", angle: 15  , bgColor: .orange  )
                //login form
            
                Form{
                    if !viewModel.errormsg.isEmpty{
                        Text(viewModel.errormsg)
                            .foregroundStyle(.red)
                    }
                    TextField("Email Address",text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    SecureField("Password",text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(
                        title: "Log In",
                        backgrounC: .green
                    ){
                            viewModel.login()
                        }.padding()
                    
                }
                .offset(y : -50)
                //create account btn
                VStack{
                    Text("New around here ?")
                    
                    NavigationLink("Create an Account",
                                   destination : RegisterView())
                }.padding(.bottom, 50)
                
                
                
                Spacer()
            }
            
        }
    }
}




#Preview {
    LoginView()
        
}
