//
//  HorizontalScrollView.swift
//  NC-MiniProject
//
//  Created by FDC-GLORYMAE on 7/31/24.
//

import SwiftUI


struct CardView: View {
    var teacher: Teacher
    
    private let bodyFont: Font = .system(size: 14)
    private func profileImage() -> Image {
        return Image(systemName: "person.crop.circle")
    }
    
    var body: some View {
        ZStack {
            Color(UIColor(red: 45/255.0, green: 45/255.0, blue: 45/255.0, alpha: 1.0))
                .cornerRadius(5)
            VStack {
                profileImage()
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding(.top, 0)
                    .background(.white)
                    .foregroundColor(.gray)
                VStack(alignment: .leading, spacing: 5){
                    Text(teacher.teacherName)
                        .font(.headline)
                    HStack {
                        Image(systemName: "flag.square")
                            .font(bodyFont)
                        Text(teacher.teacherCountry)
                            .font(bodyFont)
                    }
                    HStack {
                        Image(systemName: "star.fill")
                            .font(bodyFont)
                        Text(teacher.teacherRating)
                            .font(bodyFont)
                    }
                    HStack {
                        Image(systemName: "chart.line.uptrend.xyaxis.circle.fill")
                            .font(bodyFont)
                        Text("\(teacher.numberLessons)")
                            .font(bodyFont)
                    }
                    HStack {
                        Image(systemName: "heart.fill")
                            .font(bodyFont)
                        Text("\(teacher.heartCount)")
                            .font(bodyFont)
                    }
                }
                .padding(.horizontal, 10)
            }
            .padding(.bottom, 10)
        }
        .frame(width: 150, height: 280)
        .shadow(color: Color.white.opacity(0.2), radius: 8, x: 0, y: 4)
        
    }
}

struct HorizontalScrollView: View {
    @ObservedObject var teacherModel: TeacherViewModel

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(teacherModel.teachers) { teacher in
                    CardView(teacher: teacher)
                }
            }
            .padding()
        }
        .onAppear {
            // - debug
//            print(teacherModel.teachers)
        }
    }
}

#Preview {
    TeachersDetailView(teacherModel: TeacherViewModel(), teacherIndex: 0)
}
