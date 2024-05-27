//
//  GlucoseGraph.swift
//  Sokar
//
//  Created by Taimoor Arif on 01/05/2024.
//

import SwiftUI
import Charts

struct GlucoseGraph: View {
    
    @State private var pointValue: String? = ""
    @State private var selectedEntry: GlucoseModel?
    
    @State private var plotWidth: CGFloat = 0
    
    private var glucoseData: [GlucoseModel]
    private var unit: Calendar.Component
    private var dateFormat: String
    
    init(glucoseData: [GlucoseModel], unit: Calendar.Component, dateFormat: String) {
        
        self.glucoseData = glucoseData
        self.unit = unit
        self.dateFormat = dateFormat
    }
    
    var body: some View {
        
        loadView
    }
}

extension GlucoseGraph {
    
    @ViewBuilder
    var loadView: some View {
        
        VStack(spacing: 10) {
            
            Chart(glucoseData) { item in
                
                LineMark(
                    x: .value("Date", item.date, unit: unit),
                    y: .value("Value", item.value)
                )
                .foregroundStyle(.accent)
                .lineStyle(.init(lineWidth: 3, lineCap: .round, lineJoin: .round))
                .interpolationMethod(.catmullRom)
                .symbol {
                    
                    Circle()
                        .fill(.red)
                        .frame(width: 6)
                        .shadow(radius: 2)
                }
                .foregroundStyle(.red)
                
                if let selectedEntry, selectedEntry.id == item.id {
                    
                    RuleMark(x: .value("BPM", selectedEntry.date))
                        .lineStyle(.init(lineWidth: 2, miterLimit: 2, dash: [2], dashPhase: 5))
                }
            }
            .padding(5)
            .frame(height: 250)
            .chartScrollTargetBehavior(
            
                // this will prevent the chart to not stop at the middle of any interval, else it will move to the nearest end point of the interval
                .valueAligned(unit: 1, majorAlignment: .page)
            )
//            .chartOverlay { proxy in
//                
//                GeometryReader { innerProxy in
//                    
//                    Rectangle()
//                        .fill(.clear).contentShape(Rectangle())
//                        .gesture(
//                            DragGesture()
//                                .onChanged { value in
//                                    
//                                    let location = value.location
//                                    
//                                    if let date : Date = proxy.value(atX: location.x) {
//                                      
//                                        debugPrint("date: \(date)")
//                                        
//                                        if let currentItem = glucoseData.first(where: { $0.date.toString(dateFormat) == date.toString(dateFormat) }) {
//                                         
//                                            self.selectedEntry = currentItem
//                                            self.plotWidth = proxy.plotSize.width
//                                        }
//                                    }
//                                }
//                                .onEnded { _ in
//                                    
//                                    self.selectedEntry = nil
//                                }
//                        )
//                }
//            }
            
            if let selectedLog = selectedEntry {
                
                Text("BPM is \(selectedLog.value) at \(selectedLog.date.toString("dd MMM yyyy h:mm a"))")
            }
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
//    ContentView()
//    GlucoseGraph(glucoseData: glucoseHourMockArray, unit: Calendar.Component.minute)
    MyGraphs()
}

struct MyGraphs: View {
    var body: some View {
        
        ScrollView {
        
            VStack {
                
                Text("Hour")
                
                GlucoseGraph(glucoseData: glucoseHourMockArray,
                             unit: .minute,
                             dateFormat: "yyyy-MM-dd HH:mm")
                
                Text("Day")
                
                GlucoseGraph(glucoseData: glucoseDayMockArray,
                             unit: .hour,
                             dateFormat: "d MMM")
                
                Text("Week")
                
                GlucoseGraph(glucoseData: glucoseWeekMockArray,
                             unit: .day,
                             dateFormat: "d MMM")
                
            }
            
            VStack {
                
                Text("Month")
                
                GlucoseGraph(glucoseData: glucoseMonthMockArray,
                             unit: .weekday,
                             dateFormat: "d MMM")
                
                Text("Six Month")
                
                GlucoseGraph(glucoseData: glucoseSixMonthMockArray,
                             unit: .month,
                             dateFormat: "MMM")
                
                Text("Year")
                
                GlucoseGraph(glucoseData: glucoseYearMockArray,
                             unit: .month,
                             dateFormat: "yyyy")
                
            }
        }
        .scrollIndicators(.never)
    }
}
