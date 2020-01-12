//
//  RecentPostView.swift
//  SuperNews
//
//  Created by Luis Zapata on 10-01-20.
//  Copyright © 2020 Luis Zapata. All rights reserved.
//

import SwiftUI

struct RecentPostView: View {
    @ObservedObject var viewModel: RecentPostViewModel
    
    init(viewModel: RecentPostViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        RefreshableNavigationView(title: "Super News", action: viewModel.fetchRecent){
            self.postsSection
        }.onAppear(perform:{
            self.viewModel.fetchRecent()
        })
    }
}

private extension RecentPostView {
    var postsSection: some View {
        Section {
            ForEach(viewModel.dataSource, content: PostRowViewModel.init(displayedPost:)).onDelete { (indexSet) in
                self.viewModel.removePost(indexSet: indexSet)
            }
        }
    }
}
