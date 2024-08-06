//
//  LessonsViewControllerWrapper.swift
//  NC-MiniProject
//
//  Created by FDC-GLORYMAE on 7/30/24.
//

import SwiftUI
import UIKit

struct LessonsViewControllerWrapper: UIViewControllerRepresentable {
    @ObservedObject var teacherModel: TeacherViewModel

    func makeUIViewController(context: Context) -> LessonsViewController {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LessonsViewController") as! LessonsViewController
        
        viewController.teachers = teacherModel.teachers
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: LessonsViewController, context: Context) {
        uiViewController.teachers = teacherModel.teachers
        uiViewController.teachersTableView.reloadData()
    }
}

