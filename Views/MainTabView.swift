//
//  MainTabView.swift
//  NC-MiniProject
//
//  Created by FDC-GLORYMAE on 7/30/24.
//

import SwiftUI

struct MainTabView: View {
    
    @ObservedObject var teacherModel: TeacherViewModel
    
    var body: some View {
        VStack{
            Spacer()
            TabView {
                LessonsViewControllerWrapper(teacherModel: teacherModel)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                
                FavoriteTutorView()
                    .tabItem {
                        Image(systemName: "heart")
                        Text("Favorite Tutor")
                    }
                
                TextbookView()
                    .tabItem {
                        Image(systemName: "text.book.closed")
                        Text("Textbook")
                    }
                
                LearningView()
                    .tabItem {
                        Image(systemName: "highlighter")
                        Text("Learning")
                    }
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("My Page")
                    }
            }
        }
        .padding(.bottom, 0)
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.stackedLayoutAppearance.selected.iconColor = UIColor.white
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]
            
            UITabBar.appearance().standardAppearance = appearance
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
        }
        .preferredColorScheme(.dark)
    }
}

