//
//  HeaderView.swift
//  ToDoList
//
//  Created by Shreya Wanjari on 26/01/24.
//

import SwiftUI

struct HeaderView: View {
    let title  : String
    let subTitle  : String
    let angle :  Double
    let bgColor : Color
    
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(bgColor)
                .rotationEffect(Angle(degrees: angle))
                
            VStack{
                Text(title)
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: 50))
                Text(subTitle)
                    .foregroundColor(.white)
                    .font(.system(size: 30))
            }.padding(.top , 80)
        }.frame(width: UIScreen.main.bounds.width * 3 ,
                height: 350)
        .offset(y: -150)
       
    }
}

#Preview {
    HeaderView(title: "Title", subTitle: "SubTitle", angle: 15, bgColor: .blue)
}
