//
//  MainInteractor.swift
//  SuperNews
//
//  Created by Luis Zapata on 10-01-20.
//  Copyright © 2020 Luis Zapata. All rights reserved.
//

import Foundation

protocol MainInteractorProtocol {
    func fetchRecentPosts(completion: @escaping ([PostsModel.Recent.ViewModel.DisplayedPost]?, Error?) -> ())
}

struct MainInteractor: MainInteractorProtocol {
    
    let newsWorker: NewsWorker
    typealias DisplayedPost = PostsModel.Recent.ViewModel.DisplayedPost
    
    init(newsWorker: NewsWorker){
        self.newsWorker = newsWorker
    }
    
    func fetchRecentPosts(completion: @escaping ([DisplayedPost]?, Error?) -> ()) {
        newsWorker.requestRecentPosts() { (response, error) -> Void in
            if response != nil {
                var viewModel: [DisplayedPost] = []
                let deletedPosts = self.newsWorker.retrieveDeletedPosts()
                for post in response!.hits! {
                    if post.story_title != nil && post.story_url != nil && !deletedPosts.contains(post.objectID){
                        viewModel.append(DisplayedPost.init(id: post.objectID,
                                               createdAt: Date(timeIntervalSince1970: post.created_at_i),
                                               author: post.author,
                                               storyTitle: post.story_title!,
                                               storyUrl: post.story_url!))
                    }
                }
                self.newsWorker.storeRecentPost(posts: viewModel)
                completion(viewModel, nil)
            } else {
                completion(self.newsWorker.retrieveRecentPosts(), error)
            }
        }
    }
}
