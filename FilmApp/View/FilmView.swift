//
//  FilmView.swift
//  FilmApp
//
//  Created by Pedro on 20/2/24.
//

import Foundation
import WebKit
import SwiftUI

struct FilmView: UIViewRepresentable {
    let videoId: String
    
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let filmURL = URL(string: "Enlace para el reproductor") else {
            return
        }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: filmURL))
    }
}
