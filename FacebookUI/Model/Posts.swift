//
//  Posts.swift
//  FacebookUI
//
//  Created by Rohit Saini on 20/02/21.
//

import Foundation

// MARK: - PageResponseElement
struct Posts: Codable {
    let post: String
    let comments: [String]
}


