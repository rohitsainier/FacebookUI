//
//  PostViewModel.swift
//  FacebookUI
//
//  Created by Rohit Saini on 20/02/21.
//

import Foundation

protocol PostDelegate{
    func didRecievedPosts()
    func didReceivedErrorInPosts()
}

class PostViewModel{
    var delegate: PostDelegate?
    var posts: [Posts] = [Posts]()
     func getPosts(using session: URLSession = .shared){
        session.request(.posts, using: Void()) { [weak self](result) in
            guard let `self` = self else {return}
            switch result{
            case .success(let response):
                self.posts = response
                print(response)
                self.delegate?.didRecievedPosts()
            case .failure(let err):
                print(err)
                self.delegate?.didReceivedErrorInPosts()
            }
        }
    }
    
}
