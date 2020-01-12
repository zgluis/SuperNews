//
//  PostRowViewModel.swift
//  SuperNews
//
//  Created by Luis Zapata on 10-01-20.
//  Copyright © 2020 Luis Zapata. All rights reserved.
//

import SwiftUI

struct PostRowViewModel: View {
    typealias DisplayedPost = PostsModel.Recent.ViewModel.DisplayedPost
    
    private let title: String
    private let author: String
    private let url: String
    private let createdAt: String?
    
    init(displayedPost: DisplayedPost) {
        self.title = displayedPost.storyTitle
        self.author = displayedPost.author ?? ""
        self.url = displayedPost.storyUrl
        self.createdAt = DateFormatter().timeSince(from: displayedPost.createdAt as NSDate, numericDates: true)
    }
    
    var body: some View {
        NavigationLink(destination:
            WebView(url: url)
                .navigationBarTitle("Isn't this a super news?", displayMode: .inline))
        {
            HStack {
                VStack(alignment: .leading, spacing: 0, content: {
                    Text(title)
                    
                    HStack(alignment: .firstTextBaseline, spacing: 0, content: {
                        Text(author)
                            .font(.body)
                            .foregroundColor(.secondary)
                        if createdAt != nil {
                            Text(" - " + createdAt!)
                                .font(.body)
                                .foregroundColor(.secondary)
                        }
                    })
                })
            }
            
        }
    }
}
#if DEBUG
struct PostRowViewModel_Previews: PreviewProvider {
    static var previews: some View {
        let displayedPost: PostsModel.Recent.ViewModel.DisplayedPost = PostsModel.Recent.ViewModel.DisplayedPost(id: "87423923", createdAt: Date(), author: "author", storyTitle: "Title", storyUrl: "https://www.google.com")
        return PostRowViewModel(displayedPost: displayedPost)
    }
}
#endif
