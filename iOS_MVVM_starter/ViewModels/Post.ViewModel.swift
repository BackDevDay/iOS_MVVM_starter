//
//  PostViewModel.swift
//  iOS_MVVM_starter
//
//  Created by เกียรติจารุพัฒน์ สมศรี on 18/3/2564 BE.
//

import Foundation

struct PostListViewModel {
    let posts : PostModel
}

extension PostListViewModel {
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.posts.count
    }
    
    func postAtIndex(_ index: Int) -> PostViewModel {
        let article = self.posts[index]
        return PostViewModel(article)
    }
    
}


struct PostViewModel {
    private let post : PostModelElement
}

extension PostViewModel {
    init(_ post: PostModelElement) {
        self.post = post
    }
}

extension PostViewModel {
    var title: String {
        return self.post.title
    }
    var body: String {
        return self.post.body
    }
}




