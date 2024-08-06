//
//  Extensions.swift
//  NC-MiniProject
//
//  Created by FDC-GLORYMAE on 7/29/24.
//

import Foundation
import UIKit
import SwiftUI


extension LessonsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return TableSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch TableSection(rawValue: section) {
            case .teacher:
                return teachers.count
            default:
                return 0
            }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = teachersTableView.dequeueReusableCell(withIdentifier: "TeacherTableCell", for: indexPath) as! TeacherTableCell
        let teacher = teachers[indexPath.row]
        cell.configure(with: teacher)
        cell.accessoryType = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedIndex = indexPath.row
        
        // Assuming you have a reference to your TeacherViewModel
        let teacherViewModel = TeacherViewModel()
        teacherViewModel.teachers = teachers // Populate the model with teachers data
        
        let teacherDetailView = TeachersDetailView(teacherModel: teacherViewModel, teacherIndex: selectedIndex)
        let hostingController = UIHostingController(rootView: teacherDetailView)
        
        hostingController.navigationController?.navigationBar.standardAppearance = UINavigationBar.appearance().standardAppearance
        hostingController.navigationController?.navigationBar.scrollEdgeAppearance = UINavigationBar.appearance().scrollEdgeAppearance
        
        
        if let navController = self.navigationController {
            navController.overrideUserInterfaceStyle = .dark
            navController.pushViewController(hostingController, animated: true)
        } else {
            print("Navigation Controller is nil")
        }
    }

}

extension View {
    func underline(_ shouldUnderline: Bool, color: Color) -> some View {
        self.overlay(
            VStack {
                if shouldUnderline {
                    Rectangle()
                        .frame(width: 100, height: 2)
                        .foregroundColor(color)
                        .padding(.top, 20) // Adjust as needed
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 10)
        )
    }
}

