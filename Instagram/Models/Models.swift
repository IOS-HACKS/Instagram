//
//  Models.swift
//  Instagram
//
//  Created by ABDUL BASITH A on 26/08/21.
//

import Foundation

public enum UserPostType {
    case photo, video
}

public enum Gender {
    case male, female, other
}

struct UserCount {
    let followers:Int
    let following:Int
    let post:Int
}

public struct User {
    let username:String
    let bio:String
    let name: (first: String, last: String)
    let brithDate:Data
    let gender:Gender
    let counts: UserCount
    let joinedDate: Date
}

public struct UserPost {
    let postType:UserPostType
    let thumbnailImage:URL
    let caption:String?
    let likeCount:[PostLikes]
    let comment:[PostComment]
    let createdDate:Date
    let taggedUsers:[String]
}



public struct PostLikes {
    let username:String
    let postIdentifier:String
}

public struct CommentLike {
    let username:String
    let commentIdentifier:String
}

public struct PostComment {
    let identifier:String
    let username:String
    let text:String
    let createdDate:Date
    let likes:[CommentLike]
}
