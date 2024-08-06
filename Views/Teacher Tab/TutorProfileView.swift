//
//  TutorProfileView.swift
//  NC-MiniProject
//
//  Created by FDC-GLORYMAE on 7/30/24.
//

import SwiftUI

struct TutorProfileView: View {
    var teacher: Teacher 
    @StateObject private var teacherModel = TeacherViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // - introduction
                SectionHeader(title: "Introduction")
                Text(teacher.teacherIntro)
                
                // - coins Consumed
                SectionHeader(title: "Coins consumed")
                VStack (alignment: .leading, spacing: 5){
                    Text("Sudden Lesson: \(teacher.suddenLesson == 0 ? "No coins required" : "\(teacher.suddenLesson) coins")")
                    Text("Booked Lesson: \(teacher.bookLesson == 0 ? "No coins required" : "\(teacher.bookLesson) coins")")
                    Text("(Callan Unlimited Option: Coins Returned After Lesson)")
                        .foregroundColor(.red)
                }
                
                // - current Address
                SectionHeader(title: "Current Address")
                Text("\(teacher.teacherCountry) • \(teacher.teacherAddress)")
                
                // - features
                SectionHeader(title: "Features")
                TeacherTagsView(teacherTags: teacher.featureTags ?? [])
                
                // - hobbies
                SectionHeader(title: "Hobbies")
                HobbiesTagView(hobbiesTags: teacher.hobbiesTags ?? [])
                
                // - work Experience
                SectionHeader(title: "Work Experience")
                VStack (alignment: .leading, spacing: 10){
                    ForEach(teacher.workExperience, id: \.period) { experience in
                        VStack(alignment: .leading){
                            Text(experience.period)
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                            Text(experience.role)
                        }
                    }
                }
                
                SectionHeader(title: "Generation choosing this instructor")
                ProgressBarChartView(progressData: teacher.progressData)
                
                SectionHeader(title: "Recommendation of Tutors")
                HorizontalScrollView(
                    teacherModel: teacherModel
//                    items: teacherModel.teachers.map { $0.teacherName }
                        )
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct SectionHeader: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 20))
            .bold()
            .padding(.bottom, 5)
            .padding(.top, 15)
    }
}

#Preview {
    TeachersDetailView(teacherModel: TeacherViewModel(), teacherIndex: 0)
}
