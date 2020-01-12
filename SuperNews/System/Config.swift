//
//  Config.swift
//  SuperNews
//
//  Created by Luis Zapata on 10-01-20.
//  Copyright © 2020 Luis Zapata. All rights reserved.
//

import Foundation

struct Constants {
    private struct Domains {
        static let production = "https://hn.algolia.com/api/v1/"
    }
    static let queryValue = "ios"
    static let baseDomain = Domains.production

    enum LocalKeys: String {
        case deletedPosts = "deletedPosts"
        case recentPosts = "recentPosts"
    }

}
