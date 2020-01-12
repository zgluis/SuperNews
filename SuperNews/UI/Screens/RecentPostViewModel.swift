//
//  NewsModel.swift
//  SuperNews
//
//  Created by Luis Zapata on 10-01-20.
//  Copyright © 2020 Luis Zapata. All rights reserved.
//

import SwiftUI

class RecentPostViewModel: ObservableObject {
    typealias DisplayedPost = PostsModel.Recent.ViewModel.DisplayedPost
    @Environment(\.interactors) var interactors: InteractorsContainer
    @Published var dataSource: [DisplayedPost] = []
    
    func fetchRecent() {
        interactors.mainInteractor.fetchRecentPosts() { (response, error) -> Void in
            if(response != nil) {
                self.dataSource = response!
            } else {
                // TODO: Show toast
                print("Error requesting recent posts")
                print(error ?? "Unknown error")
            }
        }
    }
    func removePost(indexSet: IndexSet) {
        var deletedPosts = defaults.getStringArray(key: .deletedPosts)
        for i in indexSet{
            deletedPosts.append(dataSource[i].id)
            dataSource.remove(at: i)
        }
        defaults.set(key: .deletedPosts, value: deletedPosts)
    }
}
