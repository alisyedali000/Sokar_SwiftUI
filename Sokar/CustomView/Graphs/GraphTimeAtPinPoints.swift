//
//  GraphTimeAtPinPoints.swift
//  Sokar
//
//  Created by Taimoor Arif on 03/05/2024.
//

import SwiftUI
import Charts

struct GraphTimeAtPinPoints: View {
    
    @State var glucoseData = glucoseDayMockArray
    
    private var scrollPosition: String = ""
    
    init(scrollPosition: String) {
        
        self.scrollPosition = scrollPosition
    }
    
    var body: some View {
        
        loadView
    }
}

extension GraphTimeAtPinPoints {
    
    @ViewBuilder
    var loadView: some View {
        
        VStack(spacing: 10) {
            
            Chart(glucoseData) { item in
                
                LineMark(
                    x: .value("Time", "\(item.time.toDateString("yyyy-MM-dd HH:mm:ss", returnFormat: "hh:mm a"))\n\(item.time.toDateString("yyyy-MM-dd HH:mm:ss", returnFormat: "d MMM yy"))"),
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
                
//                PointMark(
//                    x: .value("Index", item.date),
//                    y: .value("Value", item.value)
//                )
//                .opacity(0)
//                .annotation(position: .top,
//                            alignment: .center,
//                            spacing: 10) {
//                    Text("\(item.value)")
//                        .font(.body)
//                        .foregroundStyle(.red)
//                }
            }
            .padding(5)
            .frame(height: 250)
            .chartScrollableAxes(.horizontal) // to horizontally scroll the chart
            .chartXVisibleDomain(length: glucoseData.count >= 5 ? 5 : glucoseData.count) // number of intervals to show at x-axis
            
            .chartScrollTargetBehavior(
            
                // this will prevent the chart to not stop at the middle of any interval, else it will move to the nearest end point of the interval
                .valueAligned(unit: 1, majorAlignment: .page)
            )
            .chartScrollPosition(initialX: scrollPosition) // to start the graph when view loads
            Text("Week")
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
    GraphTimeAtPinPoints(scrollPosition: "07:36 PM\n5 Apr 24")
}
