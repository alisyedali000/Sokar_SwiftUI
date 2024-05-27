//
//  ContentView.swift
//  Sokar
//
//  Created by Taimoor Arif on 26/03/2024.
//

import SwiftUI
import WebKit

struct ContentView: View {
    
    @State private var showingSheet = false
    
    var body: some View {
        
        Group {
            
//            Button(action: {
//                showingSheet.toggle()
//            }) {
//                Text("Open URL in Sheet")
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(8)
//            }
            
                                OnBoardingView()
            //                    TabBarController()
        }
        
//        .sheet(isPresented: $showingSheet) {
//            WebView(url: URL(string: "https://sandbox-accesslist.microtechmd.com")!)
//        }
    }
}

#Preview {
    ContentView()
}

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
