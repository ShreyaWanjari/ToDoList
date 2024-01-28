//
//  TLButton.swift
//  ToDoList
//
//  Created by Shreya Wanjari on 26/01/24.
//

import SwiftUI

struct TLButton: View {
    let title : String
    let backgrounC  : Color
    let action : () -> Void
    
    var body: some View {
        Button{
            //attempt log in
            action()
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgrounC)
                Text(title)
                    .bold()
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    TLButton(title: "Log In",
             backgrounC : .pink) {
        
    }
}
