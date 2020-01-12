//
//  PostRowModel.swift
//  SuperNews
//
//  Created by Luis Zapata on 10-01-20.
//  Copyright © 2020 Luis Zapata. All rights reserved.
//

import Foundation

enum PostsModel {
    enum Recent {
        struct Request {}
        
        struct Response: Decodable {
            var hits: [Hit]?
            struct Hit: Decodable {
                var created_at_i: Double
                var author: String?
                var story_title: String?
                var story_url: String?
                var objectID: String
            }
        }
        
        struct ViewModel {
            struct DisplayedPost: Identifiable, Encodable, Decodable {
                var id: String
                var createdAt: Date
                var author: String?
                var storyTitle: String
                var storyUrl: String
            }
        }
    }

}


