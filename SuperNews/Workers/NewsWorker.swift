//
//  NewsWorker.swift
//  SuperNews
//
//  Created by Luis Zapata on 10-01-20.
//  Copyright © 2020 Luis Zapata. All rights reserved.
//

import Foundation
import SwiftUI

class NewsWorker {
    
    typealias DisplayedPost = PostsModel.Recent.ViewModel.DisplayedPost
    
    func requestRecentPosts(completion: @escaping (PostsModel.Recent.Response?, Error?) -> ()) {
        let fullResource = "search_by_date?query=" + Constants.queryValue
        requestHandler.get(resource: fullResource).validate().responseJSON (completionHandler: { response in
            switch response.result {
            case .success(_):
                do {
                    let decodedResponse = try JSONDecoder().decode(PostsModel.Recent.Response.self, from: response.data!)
                    completion(decodedResponse,nil)
                } catch let err {
                    print("Error parsing: \(err)")
                    completion(nil,err)
                }
            case .failure(let err):
                completion(nil,err)
            }
            
        })
    }
    
    func storeRecentPost(posts: [DisplayedPost]) {
        if let encoded = try? JSONEncoder().encode(posts) {
            defaults.set(key: .recentPosts, value: encoded)
        }
    }
    
    func retrieveRecentPosts() -> [DisplayedPost] {
        do {
            let recentPosts = defaults.get(key: .recentPosts)
            return try JSONDecoder().decode([DisplayedPost].self, from: recentPosts as! Data)
        } catch let err {
            print("Error retrieving stored posts")
            print(err)
            return []
        }
    }
    
    func retrieveDeletedPosts() -> [String] {
        return defaults.getStringArray(key: .deletedPosts)
    }
}
