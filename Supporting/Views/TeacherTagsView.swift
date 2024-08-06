//
//  TeacherTagsView.swift
//  NC-MiniProject
//
//  Created by FDC-GLORYMAE on 7/30/24.
//

import SwiftUI

struct TeacherTagsView: View {
    var teacherTags: [String]
    
    private let tagHeight: CGFloat = 30
    private let tagWidth: CGFloat = 90
    private let spacing: CGFloat = 8

    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack(spacing: spacing) {
                ForEach(teacherTags, id: \.self) { tag in
                    Text(tag)
                        .font(.system(size: 12))
                        .frame(width: tagWidth, height: tagHeight)
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
            }
        }
    }
}



