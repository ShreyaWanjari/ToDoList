//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Shreya Wanjari on 26/01/24.
//
import FirebaseAuth
import Foundation
class LoginViewViewModel  : ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errormsg = ""
    
    init(){}
        func login(){
            guard validate() else{
                return
            }
            //try log in
            Auth.auth().signIn(withEmail: email , password: password)
            
         }
        private func validate() -> Bool{
            errormsg = ""
            guard !email.trimmingCharacters(in: .whitespaces).isEmpty ,
                  !password.trimmingCharacters(in: .whitespaces).isEmpty else{
                errormsg = "Please fill in all the fields"
                return false
            }
            guard email.contains("@") && email.contains(".") else{
                errormsg = "Invalid email"
                return false
            }
            
            return true
        }
    
}
