//
//  TeachersDetailView.swift
//  NC-MiniProject
//
//  Created by FDC-GLORYMAE on 7/29/24.
//

import SwiftUI

enum CurrentView {
    case profile
    case lesson
    case reviews
}

struct TeachersDetailView: View {
    @ObservedObject var teacherModel: TeacherViewModel
    var teacherIndex: Int // - index or ID to find the specific teacher
    @State private var currentView: CurrentView = .profile
//    private let videoURL1 = URL(string: "https://videos.pexels.com/video-files/2795405/2795405-uhd_1440_2560_25fps.mp4")!
    
    private var teacher: Teacher {
        teacherModel.teachers[teacherIndex]
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                headerView
                Spacer()
                // - video temp placeholder
                HStack {
                    ZStack {
                        Color.gray.opacity(0.2)
                        
                        if let urlString = teacher.videoUrl,
                           let videoURL = URL(string: urlString) {
                            VideoPlayerView(videoURL: videoURL)
                                .edgesIgnoringSafeArea(.all)
                        } else {
                            Image(systemName: "video.slash")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .foregroundColor(.gray)
                        }
                    }
                    .frame(width: 150, height: 300)
                    .cornerRadius(8)
                    
                    // Teacher details
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Country: \(teacher.teacherCountry)")
                        HStack {
                            Image(systemName: "briefcase.fill")
                            Text(teacher.teacherExperience.formattedString)
                        }
                        HStack {
                            Image(systemName: "star.fill")
                            Text(teacher.teacherRating)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        }
                        HStack {
                            Image(systemName: "chart.line.uptrend.xyaxis.circle.fill")
                            Text("\(teacher.numberLessons)")
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        }
                        HStack {
                            Image(systemName: "heart.fill")
                            Text("\(teacher.heartCount)")
                        }
                        HStack {
                            Image(systemName: "clock.fill")
                            Text("\(teacher.formattedJoinDate)")
                        }
                    }
                }
                VStack {
                    Button(action: {
                        // Action here
                    }, label: {
                        Text(teacher.isOnline == true
                             ? (teacher.isBusy == true ? "Busy" : "Start Sudden Lesson")
                            : "Offline")
                            .foregroundColor(.white)
                            .font(.headline)
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(
                                        teacher.isOnline
                                            ? (teacher.isBusy ? Color.pink : Color.blue)
                                            : Color.gray
                                    )
                            )
                    })
                    Button(action: {
                        // Action here
                    }, label: {
                        HStack {
                            Image(systemName: "calendar")
                                .foregroundColor(.black)
                            
                            Text("Booked Lesson")
                                .foregroundColor(.black)
                                .font(.headline)
                                .bold()
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    })
                }
                VStack {
                    HStack(spacing: 20) {
                        VStack {
                            Image(systemName: "heart")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding(.horizontal)
                            Text("Favorites")
                                .font(.footnote)
                        }
                        VStack {
                            Image(systemName: "arrow.clockwise")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding(.horizontal)
                            Text("Refresh")
                                .font(.footnote)
                        }
                        VStack {
                            Image(systemName: "square.and.arrow.up")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding(.horizontal)
                            Text("Share")
                                .font(.footnote)
                        }
                        VStack {
                            Image(systemName: "note.text")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding(.horizontal)
                            Text("Keep Note")
                                .font(.footnote)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                }
                
                VStack {
                    HStack(spacing: 25) {
                        Button(action: {
                            currentView = .profile
                        }) {
                            Text("Tutor's Profile")
                                .underline(currentView == .profile, color: .yellow)
                                .foregroundColor(.white)
                        }
                        
                        Button(action: {
                            currentView = .lesson
                        }) {
                            Text("Lesson Detail")
                                .underline(currentView == .lesson, color: .yellow)
                                .foregroundColor(.white)
                        }
                        
                        Button(action: {
                            currentView = .reviews
                        }) {
                            Text("Reviews")
                                .underline(currentView == .reviews, color: .yellow)
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    Spacer()
                    
                    switch currentView {
                    case .profile:
                        TutorProfileView(teacher: teacher)
                    case .lesson:
                        LessonDetailView()
                    case .reviews:
                        ReviewsView()
                    }
                }
                
            }
            .padding()
            .background(Color.black)
            .foregroundColor(.white)
        }
            .preferredColorScheme(.dark)
        
    }
    
    
    
    private var headerView: some View {
        HStack {
            Image(uiImage: teacher.teacherProfile ?? UIImage(systemName: "person.crop.circle.fill")!)
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())

            Text(teacher.teacherName)
                .font(.headline)
            Text("(Age: \(teacher.teacherAge))")
                .font(.footnote)
            Spacer()
            Image(systemName: "ellipsis")
                .contextMenu {
                    Button(action: {
                        // Action here
                    }, label: {
                        Text("Action 1")
                    })
                }
        }
    }
}


#Preview {
    TeachersDetailView(teacherModel: TeacherViewModel(), teacherIndex: 0)
}
