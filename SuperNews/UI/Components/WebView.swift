//
//  WebView.swift
//  SuperNews
//
//  Created by Luis Zapata on 10-01-20.
//  Copyright © 2020 Luis Zapata. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let url: String
    
    func makeUIView(context: Context) -> WKWebView {
        WKWebView(frame: .zero)
    }
    
    func updateUIView(_ view: WKWebView, context: UIViewRepresentableContext<WebView>) {
        let request = URLRequest(url: URL(string: self.url)!)
        print("Loading url\(self.url)")
        view.load(request)
    }
}
