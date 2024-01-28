//
//  ContentView.swift
//  ToDoList
//
//  Created by Shreya Wanjari on 25/01/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            //signed in state
            TabView{
                ToDoListView(userId:viewModel.currentUserId)
                    .tabItem {
                        Label("Home",systemImage: "house")
                    }
                ProfileView()
                    .tabItem {
                        Label("Profile",systemImage: "person.circle")
                     }
            }
            
        }else{
            LoginView()
        }
        
    }
}

#Preview {
    MainView()
}
