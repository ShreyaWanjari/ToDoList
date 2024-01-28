//
//  ProfileView.swift
//  ToDoList
//
//  Created by Shreya Wanjari on 25/01/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()

    var body: some View {
        NavigationView{
            VStack{
                
            }.navigationTitle("Profile")
                
        }
    }
}

#Preview {
    ProfileView()
}
