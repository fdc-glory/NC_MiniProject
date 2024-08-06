//
//  TeachersModel.swift
//  NC-MiniProject
//
//  Created by FDC-GLORYMAE on 7/29/24.
//

import Foundation
import UIKit
import SwiftUI
import Combine


class TeacherViewModel: ObservableObject {
    @Published var teachers: [Teacher] = mockTeachers
}


struct Period {
    var years: Int
    var months: Int
    
    func totalMonths() -> Int {
        return (years * 12) + months
    }
    
    var formattedString: String {
        var components: [String] = []
        
        if years > 0 {
            components.append("\(years) year\(years > 1 ? "s" : "")")
        }
        if months > 0 {
            components.append("\(months) month\(months > 1 ? "s" : "")")
        }
        
        return components.joined(separator: " and ")
    }
}

struct WorkExperience {
    let period: String
    let role: String
}


// - convert a date string to a Date object
func date(from string: String, format: String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    return dateFormatter.date(from: string)
}



struct Teacher: Identifiable {
    var id = UUID()
    var teacherProfile: UIImage?
    var videoUrl: String?
    let teacherName: String
    let teacherAge: Int
    let teacherCountry: String
    let teacherExperience: Period
    let teacherRating: String
    let numberLessons: Int
    let coinAmount: Int
    let teacherTags: [String]?
    let heartCount: Int
    let lastLogin: Date
    let isHeart: Bool
    let isOnline: Bool
    let isBusy: Bool

    // // part 2: for Teacher Tabs
    let teacherIntro: String
    let teacherAddress: String
    let suddenLesson: Int
    let bookLesson: Int

    // part 3:
    let featureTags: [String]?
    let hobbiesTags: [String]?
    let workExperience: [WorkExperience]

    // part 4
    let progressData: [String: Double]

    var formattedJoinDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: lastLogin)
    }
}



let mockTeachers: [Teacher] = [
    Teacher(
        teacherProfile: nil,
        videoUrl: nil, 
        teacherName: "Teacher One",
        teacherAge: 35,
        teacherCountry: "Japan",
        teacherExperience: Period(years: 10, months: 7),
        teacherRating: "5.00",
        numberLessons: 1053,
        coinAmount: 100,
        teacherTags: ["for kids", "test"],
        heartCount: 130,
        lastLogin: date(from: "2024-07-26", format: "yyyy-MM-dd") ?? Date(),
        isHeart: false,
        isOnline: false,
        isBusy: false,

        // part 2
        teacherIntro: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
        teacherAddress: "Tokyo",
        suddenLesson: 0,
        bookLesson: 100,

        // part 3
        featureTags: ["Feature tag 1", "Feature tag 2", "Feature tag 3"],
        hobbiesTags: ["Hobby tag 1", "Hobby tag 2", "Hobby tag 3"],
        workExperience: [
            WorkExperience(period: "2016-07-01 - Current", role: "Assessment"),
            WorkExperience(period: "2010-11-01 - 2016-06-11", role: "Teacher/Lecturer/Instructor"),
            WorkExperience(period: "2008-05-01 - 2010-11-01", role: "Teacher/Lecturer/Instructor")
        ],

        // part 4
        progressData: ["<-9": 15.38, "10s": 15.38, "20s": 6.92, "30s": 7.69, "40s": 6.15, "50s": 42.31, "60->": 6.15]
    ),
    Teacher(
        teacherProfile: nil,
        videoUrl: nil,
        teacherName: "Teacher Two",
        teacherAge: 42,
        teacherCountry: "South Korea",
        teacherExperience: Period(years: 15, months: 3),
        teacherRating: "4.75",
        numberLessons: 850,
        coinAmount: 150,
        teacherTags: ["advanced", "business"],
        heartCount: 200,
        lastLogin: date(from: "2024-07-30", format: "yyyy-MM-dd") ?? Date(),
        isHeart: true,
        isOnline: true,
        isBusy: true,

        // part 2
        teacherIntro: "A passionate teacher with extensive experience in business English and advanced language skills.",
        teacherAddress: "Seoul",
        suddenLesson: 5,
        bookLesson: 80,

        // part 3
        featureTags: ["Business English", "Advanced Grammar"],
        hobbiesTags: ["Travel", "Photography"],
        workExperience: [
            WorkExperience(period: "2015-06-01 - Current", role: "Business English Trainer"),
            WorkExperience(period: "2010-03-01 - 2015-05-31", role: "English Instructor"),
            WorkExperience(period: "2005-01-01 - 2010-02-28", role: "Language Consultant")
        ],

        // part 4
        progressData: ["<-9": 10.00, "10s": 12.00, "20s": 8.00, "30s": 15.00, "40s": 20.00, "50s": 25.00, "60->": 10.00]
    ),
    Teacher(
        teacherProfile: nil,
        videoUrl: nil,
        teacherName: "Teacher Three",
        teacherAge: 29,
        teacherCountry: "China",
        teacherExperience: Period(years: 7, months: 2),
        teacherRating: "4.90",
        numberLessons: 650,
        coinAmount: 75,
        teacherTags: ["beginner", "Chinese"],
        heartCount: 95,
        lastLogin: date(from: "2024-07-28", format: "yyyy-MM-dd") ?? Date(),
        isHeart: true,
        isOnline: false,
        isBusy: false,

        // part 2
        teacherIntro: "Specializing in beginner Chinese lessons with a focus on conversational skills.",
        teacherAddress: "Beijing",
        suddenLesson: 3,
        bookLesson: 50,

        // part 3
        featureTags: ["Conversational Chinese", "Beginner"],
        hobbiesTags: ["Cooking", "Music"],
        workExperience: [
            WorkExperience(period: "2019-01-01 - Current", role: "Chinese Tutor"),
            WorkExperience(period: "2016-06-01 - 2018-12-31", role: "Language Assistant")
        ],

        // part 4
        progressData: ["<-9": 12.00, "10s": 20.00, "20s": 15.00, "30s": 18.00, "40s": 10.00, "50s": 15.00, "60->": 10.00]
    ),
    Teacher(
        teacherProfile: nil,
        videoUrl: "https://videos.pexels.com/video-files/2795405/2795405-uhd_1440_2560_25fps.mp4",
        teacherName: "Teacher Four",
        teacherAge: 31,
        teacherCountry: "Germany",
        teacherExperience: Period(years: 12, months: 5),
        teacherRating: "4.85",
        numberLessons: 920,
        coinAmount: 125,
        teacherTags: ["intermediate", "German"],
        heartCount: 170,
        lastLogin: date(from: "2024-07-27", format: "yyyy-MM-dd") ?? Date(),
        isHeart: false,
        isOnline: true,
        isBusy: true,

        // part 2
        teacherIntro: "Experienced in teaching intermediate German with a focus on grammar and conversation.",
        teacherAddress: "Berlin",
        suddenLesson: 7,
        bookLesson: 90,

        // part 3
        featureTags: ["Intermediate German", "Grammar"],
        hobbiesTags: ["Cycling", "Reading"],
        workExperience: [
            WorkExperience(period: "2018-04-01 - Current", role: "German Teacher"),
            WorkExperience(period: "2012-01-01 - 2018-03-31", role: "German Language Specialist")
        ],

        // part 4
        progressData: ["<-9": 8.00, "10s": 15.00, "20s": 12.00, "30s": 20.00, "40s": 18.00, "50s": 20.00, "60->": 7.00]
    ),
    Teacher(
        teacherProfile: nil,
        videoUrl: nil, 
        teacherName: "Teacher Five",
        teacherAge: 31,
        teacherCountry: "Brazil",
        teacherExperience: Period(years: 9, months: 0),
        teacherRating: "4.95",
        numberLessons: 780,
        coinAmount: 90,
        teacherTags: ["advanced", "Portuguese"],
        heartCount: 160,
        lastLogin: date(from: "2024-07-25", format: "yyyy-MM-dd") ?? Date(),
        isHeart: true,
        isOnline: false,
        isBusy: false,

        // part 2
        teacherIntro: "Specializes in advanced Portuguese with a strong emphasis on fluency and advanced language skills.",
        teacherAddress: "Rio de Janeiro",
        suddenLesson: 2,
        bookLesson: 70,

        // part 3
        featureTags: ["Advanced Portuguese", "Fluency"],
        hobbiesTags: ["Surfing", "Traveling"],
        workExperience: [
            WorkExperience(period: "2017-05-01 - Current", role: "Portuguese Language Expert"),
            WorkExperience(period: "2013-03-01 - 2017-04-30", role: "Language Instructor")
        ],

        // part 4
        progressData: ["<-9": 5.00, "10s": 10.00, "20s": 10.00, "30s": 25.00, "40s": 20.00, "50s": 20.00, "60->": 10.00]
    )
]


    //struct TeacherResponse: Codable {
    //    let teacher: Teacher
    //}
    
    //class TeacherViewModel: ObservableObject {
    //    @Published var teachers: [Teacher] = []
    //
    //    private let apiURL = URL(string: "https://english-staging.fdc-inc.com/api/teachers/detail")!
    //    private let apiVersion = 30
    //    private let usersApiToken = "69fdc535dcddef5d15f68bb187eb3ef8"
    //    private let deviceType = 1
    //    private let teachersId = 117076
    //    private let emergencyLesson = 0
    //    private let appVersion = "4.8.5"
    //
    //    init() {
    //        fetchTeacherDetails()
    //    }
    //
    //    func fetchTeacherDetails() {
    //        var request = URLRequest(url: apiURL)
    //        request.httpMethod = "POST"
    //        let params = [
    //            "api_version": apiVersion,
    //            "users_api_token": usersApiToken,
    //            "device_type": deviceType,
    //            "teachers_id": teachersId,
    //            "emergency_lesson": emergencyLesson,
    //            "app_version": appVersion
    //        ] as [String: Any]
    //
    //        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
    //        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    //
    //        URLSession.shared.dataTask(with: request) { data, response, error in
    //            if let data = data {
    //                do {
    //                    let response = try JSONDecoder().decode(TeacherResponse.self, from: data)
    //                    DispatchQueue.main.async {
    //                        self.teachers = [response.teacher]
    //                    }
    //                } catch {
    //                    print("Error decoding data: \(error)")
    //                }
    //            } else if let error = error {
    //                print("HTTP Request Failed \(error)")
    //            }
    //        }.resume()
    //    }
    //}

    //struct Teacher: Identifiable, Codable {
    //    var id = UUID()
    //    var teacherProfile: String?
    //    var videoUrl: String?
    //    let teacherName: String
    //    let teacherAge: Int
    //    let teacherCountry: String
    //    let teacherExperience: Period
    //    let teacherRating: String
    //    let numberLessons: Int
    //    let coinAmount: Int
    //    let teacherTags: [String]?
    //    let heartCount: Int
    //    let lastLogin: Date
    //    let isHeart: Bool
    //    let isOnline: Bool
    //    let isBusy: Bool
    //    let teacherIntro: String
    //    let teacherAddress: String
    //    let suddenLesson: Int
    //    let bookLesson: Int
    //    let featureTags: [String]?
    //    let hobbiesTags: [String]?
    //    let workExperience: [WorkExperience]
    //    let progressData: [String: Double]
    //
    //    enum CodingKeys: String, CodingKey {
    //        case teacherProfile = "teacher_profile"
    //        case videoUrl = "video_url"
    //        case teacherName = "teacher_name"
    //        case teacherAge = "teacher_age"
    //        case teacherCountry = "teacher_country"
    //        case teacherExperience = "teacher_experience"
    //        case teacherRating = "teacher_rating"
    //        case numberLessons = "number_lessons"
    //        case coinAmount = "coin_amount"
    //        case teacherTags = "teacher_tags"
    //        case heartCount = "heart_count"
    //        case lastLogin = "last_login"
    //        case isHeart = "is_heart"
    //        case isOnline = "is_online"
    //        case isBusy = "is_busy"
    //        case teacherIntro = "teacher_intro"
    //        case teacherAddress = "teacher_address"
    //        case suddenLesson = "sudden_lesson"
    //        case bookLesson = "book_lesson"
    //        case featureTags = "feature_tags"
    //        case hobbiesTags = "hobbies_tags"
    //        case workExperience = "work_experience"
    //        case progressData = "progress_data"
    //    }
    //}
