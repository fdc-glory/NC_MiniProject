//
//  ProgressBarChartView.swift
//  NC-MiniProject
//
//  Created by FDC-GLORYMAE on 7/30/24.
//

import SwiftUI


struct ProgressBarChartView: View {
    let progressData: [String: Double] // - percentage (0 - 100)
    let barHeight: CGFloat = 15 // - height of each bar
    let maxBarWidth: CGFloat = 300 // - maximum width for the progress bars

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(sortedProgressData(), id: \.key) { key, value in
                HStack {
                    Text(key)
                        .font(.caption)
                        .frame(width: 40, alignment: .leading)

                    ProgressBar(percentage: value)
                        .frame(height: barHeight)
                        .padding(.leading, 8)

                    Text("\(Int(value))%")
                        .font(.caption)
                        .frame(width: 40, alignment: .trailing)
                }
            }
        }
        .padding()
    }

    // Function to sort the progress data
    private func sortedProgressData() -> [(key: String, value: Double)] {
        return progressData.sorted { $0.key < $1.key }
    }
}

struct ProgressBar: View {
    let percentage: Double
    private let color: Color = .gray

    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.gray.opacity(0.3))
            
            RoundedRectangle(cornerRadius: 5)
                .fill(color)
                .frame(width: CGFloat(percentage) / 100 * 300) // - scale percentage to bar width
        }
    }
}

