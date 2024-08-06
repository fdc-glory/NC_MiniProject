//
//  PagingViewController.swift
//  NC-MiniProject
//
//  Created by FDC-GLORYMAE on 7/29/24.
//

import UIKit
import LZViewPager
import SwiftUI


class PagingViewController: BaseViewController, LZViewPagerDelegate, LZViewPagerDataSource {
    
    // MARK: outlets
    @IBOutlet weak var viewPager: LZViewPager!
    
    // MARK: variables
    private var subControllers: [UIViewController] = []
    private var teacherModel = TeacherViewModel()


    override func viewDidLoad() {
        super.viewDidLoad()
        viewPagerProperties()
    }
    
    // MARK: properties
    func viewPagerProperties() {
        viewPager.delegate = self
        viewPager.dataSource = self
        viewPager.hostController = self
        
        let mainTabView = MainTabView(teacherModel: teacherModel)
        let mainTabVC = UIHostingController(rootView: mainTabView)
        
        let ncPlusVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NCPlusViewController") as! NCPlusViewController
        
        mainTabVC.title = "Lessons"
        ncPlusVC.title = "NC+"
        
        subControllers = [mainTabVC, ncPlusVC]
        viewPager.reload()
    }
    
    func numberOfItems() -> Int {
        return self.subControllers.count
    }
    
    func controller(at index: Int) -> UIViewController {
        return subControllers[index]
    }
    
    func button(at index: Int) -> UIButton {
        let button = UIButton()
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16) // Make text bold
        return button
    }
    
    // MARK: - LZViewPagerDataSource
    
    func backgroundColorForHeader() -> UIColor {
        return .black
    }

    func colorForIndicator(at index: Int) -> UIColor {
        return .yellow
    }
    

}

