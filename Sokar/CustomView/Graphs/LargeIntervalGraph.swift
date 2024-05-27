//
//  LargeIntervalGraph.swift
//  Sokar
//
//  Created by Taimoor Arif on 03/05/2024.
//

import SwiftUI
import Charts

struct LargeIntervalGraph: View {
    var body: some View {
        
        loadView()
    }
}

extension LargeIntervalGraph {
    
    func loadView() -> some View {
        
        VStack(spacing: 10) {
            
            Chart(glucoseHourMockArray) { item in
                
                LineMark(
                    x: .value("Date", item.date, unit: .minute),
                    y: .value("Value", item.value)
                )
                .foregroundStyle(.accent)
                .lineStyle(.init(lineWidth: 3, lineCap: .round, lineJoin: .round))
                .interpolationMethod(.catmullRom)
                .symbol {
                    
                    Circle()
                        .fill(.red)
                        .frame(width: 10)
                        .shadow(radius: 2)
                }
                .foregroundStyle(.red)
                
                PointMark(
                    x: .value("Index", item.date),
                    y: .value("Value", item.value)
                )
                .opacity(0)
                .annotation(position: .top,
                            alignment: .center,
                            spacing: 10) {
//                    Text("\(item.value)\nat \(item.date.toString("h:mm a"))")
//                        .font(.body)
//                        .foregroundStyle(.red)
                }
            }
            .padding(5)
            .frame(height: 250)
            .chartScrollableAxes(.horizontal)
            .chartScrollTargetBehavior(
            
                // this will prevent the chart to not stop at the middle of any interval, else it will move to the nearest end point of the interval
                .valueAligned(unit: 1, majorAlignment: .page)
            )
            
            Text("Day")
        }
        .padding(15)
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .background {
            
            RoundedRectangle(cornerRadius: 18)
                .foregroundStyle(.white.opacity(0.1))
        }
    }
}

#Preview {
    LargeIntervalGraph()
}
