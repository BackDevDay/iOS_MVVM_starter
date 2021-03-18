//
//  Post.Model.swift
//  iOS_MVVM_starter
//
//  Created by เกียรติจารุพัฒน์ สมศรี on 18/3/2564 BE.
//

import Foundation

// MARK: - PostModelElement
struct PostModelElement: Codable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias PostModel = [PostModelElement]
