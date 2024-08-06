//
//  LessonsViewController.swift
//  NC-MiniProject
//
//  Created by FDC-GLORYMAE on 7/29/24.
//

import UIKit

enum TableSection: Int, CaseIterable {
    case teacher
}

class LessonsViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet weak var teachersTableView: UITableView!
    

    // MARK: - Variables
    var teachers: [Teacher] = []
    let imageURL = URL(string: "https://images.pexels.com/photos/1130626/pexels-photo-1130626.jpeg")!
    let fallbackImage = UIImage(systemName: "person.crop.circle.fill")!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        loadTeacherProfiles()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // - reload profiles on view appearance to handle any updates
        loadTeacherProfiles()
    }
    

    // MARK: - Setup Methods
    private func setupTableView() {
        teachersTableView.delegate = self
        teachersTableView.dataSource = self
        let subHeaderNib = UINib(nibName: "SubHeaderCell", bundle: nil)
       teachersTableView.register(subHeaderNib, forCellReuseIdentifier: "SubHeaderCell")

       let teacherNib = UINib(nibName: "TeacherTableCell", bundle: nil)
       teachersTableView.register(teacherNib, forCellReuseIdentifier: "TeacherTableCell")
    }
    
    enum TableSection: Int, CaseIterable {
        case subHeader
        case teacher
    }
    

    // MARK: - Image Loading
    private func loadImage(from url: URL) async throws -> UIImage? {
        let session = URLSession(configuration: .default)
        let (data, _) = try await session.data(from: url)
        return UIImage(data: data)
    }

    private func loadTeacherProfiles() {
        Task {
            do {
                let uniqueImageURL = URL(string: "\(imageURL)?timestamp=\(Date().timeIntervalSince1970)")!
                let image = try await loadImage(from: uniqueImageURL) ?? fallbackImage
                updateTeachersProfileImage(with: image)
            } catch {
                updateTeachersProfileImage(with: fallbackImage)
            }
        }
    }

    private func updateTeachersProfileImage(with image: UIImage) {
        for index in teachers.indices {
            teachers[index].teacherProfile = image
        }
        DispatchQueue.main.async {
            self.teachersTableView.reloadData()
        }
    }
}

