//
//  WheelPicker.swift
//  Sokar
//
//  Created by Taimoor Arif on 28/03/2024.
//

import SwiftUI
import AudioToolbox

struct WheelPicker: View {
    
    @State var offset: CGFloat = 0
    
    @Binding var returnValue: Int
    private var startPoint: Int
    private var endPoint: Int
    
    init(returnValue: Binding<Int>, startPoint: Int, endPoint: Int) {
        
        self._returnValue = returnValue
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
    
    var body: some View {
        
        VStack {
            
//            Text("\(finalValue) kg")
            
            // 1 picker count is equal to 5
            
            let pickerCount = (endPoint - startPoint) / 5
            
            CustomSlider(offSet: $offset, pickerCount: pickerCount) {
                
                // picking from 40 kg to 100
                
                HStack(spacing: 0) {
                    
                    ForEach(1...pickerCount, id: \.self) { index in
                        
                        VStack {
                            
                            Rectangle()
                                .fill(.white)
                                .frame(width: 1, height: 30)
                            
                            Text("\((startPoint - 5) + (index * 5))")
                                .font(.light(size: 10))
                                .foregroundStyle(.white)
                        }
                        // each picker tick will have 20 width
                        .frame(width: 20)
                        
                        /// Subticks
                        // fixed subticks will have 4 for each main tick
                        ForEach(1...4, id: \.self) { subIndex in
                            
                            Rectangle()
                                .fill(.white)
                                .frame(width: 1, height: 15)
                            // each picker tick will have 20 width
                                .frame(width: 20)
                        }
                    }
                    
                    VStack(spacing: 10) {
                        
                        Rectangle()
                            .fill(.white)
                            .frame(width: 1, height: 30)
                        
                        Text("\(endPoint)")
                            .font(.light(size: 10))
                            .foregroundStyle(.white)
                    }
                    // each picker tick will have 20 width
                    .frame(width: 20)
                }
                
                // moving first tick to center
                .offset(x: (getRect().width - 30) / 2)
                .padding(.trailing, getRect().width - 30)
            }
            .frame(height: 50)
            .overlay(content: {
                Rectangle()
                    .fill(Color.accentColor)
                    .frame(width: 3, height: 50)
                    .offset(x: 0.4, y: -9)
                    .padding(.bottom)
            })
        }
        .onChange(of: offset) {
            getWeight()
//            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
//            AudioServicesPlayAlertSound(1107)
        }
    }
    
    func getWeight() {
        
        let startWeight = startPoint
        
        let progress = offset / 20
        
        // each subtick will be calculated as 1
        let totalWeight = startWeight + (Int(progress) * 1)
        
        self.returnValue = totalWeight
    }
}

#Preview {
    WheelPicker(returnValue: .constant(40), startPoint: 30, endPoint: 150)
}

func getRect() -> CGRect {
    return UIScreen.main.bounds
}

struct CustomSlider<Content: View> : UIViewRepresentable {
    
    private var content: Content
    private var pickerCount: Int
    @Binding private var offSet: CGFloat
    
    init(offSet: Binding<CGFloat>,
         pickerCount: Int,
         @ViewBuilder content:  @escaping () -> Content) {
        self.content = content()
        self._offSet = offSet
        self.pickerCount = pickerCount
    }
    
    func makeCoordinator() -> Coordinator {
        return CustomSlider.Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        
        let scrollView = UIScrollView()
        
        let swiftUIView = UIHostingController(rootView: content).view!
        
        // swiftui width will be totla of picker count multiplied with 20 + screen size
        
        // each picker count has 4 subpickers...
        // so 6*4 = 24 + 6 = 30
        // picker * 5
        
        let width = CGFloat((pickerCount * 5) * 20) + ( getRect().width - 30)
        
        swiftUIView.frame = CGRect(x: 0, y: 0, width: width, height: 50)
        
        swiftUIView.backgroundColor = UIColor.clear
        
        scrollView.contentSize = swiftUIView.frame.size
        scrollView.addSubview(swiftUIView)
        
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        
        scrollView.delegate = context.coordinator
        
        return scrollView
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
    }
    
    // Delegate methods for offset
    class Coordinator : NSObject, UIScrollViewDelegate {
        
        private var parent: CustomSlider
        
        init(parent: CustomSlider) {
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            
            parent.offSet = scrollView.contentOffset.x
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            
            let offSet = scrollView.contentOffset.x
            
            let value = (offSet / 20).rounded(.toNearestOrAwayFromZero)
            
            scrollView.setContentOffset(CGPoint(x: value * 20, y: 0), animated: false)
            
            // Tick and vibrate sound
            // On end...
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
            // tick sound code
            AudioServicesPlayAlertSound(1157)
        }
        
        func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
            
            // if end decelerate not fired
            
            if !decelerate {
                
                let offSet = scrollView.contentOffset.x
                
                let value = (offSet / 20).rounded(.toNearestOrAwayFromZero)
                
                scrollView.setContentOffset(CGPoint(x: value * 20, y: 0), animated: false)
                
                // Tick and vibrate sound
                // On end...
                AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
                // tick sound code
                AudioServicesPlayAlertSound(1157)
            }
        }
    }
}
