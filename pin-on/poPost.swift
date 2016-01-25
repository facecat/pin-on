//
//  poPost.swift
//  pin-on
//
//  Created by 邱国邦 on 16/1/14.
//  Copyright © 2016年 FaceCat. All rights reserved.
//

import Foundation

class poPost {
    
    private var _userName: String!
    private var _userImg: String!
    private var _imageUrl: String!
    private var _postDescription: String?
    private var _likes: String!
    private var _postTime: String!
    private var _postKey: String!
    
    var userName: String {
        return _userName
    }
    
    var userImg: String {
        return _userImg
    }
    
    var imageUrl: String! {
        return _imageUrl
    }
    
    var postDescription: String? {
        return _postDescription
    }
    
    var likes: String {
        return _likes
    }
    
    var postTime: String {
        return _postTime
    }
    
    init(username: String, imgUrl: String, postDesc: String) {
        _userName = username
        _imageUrl = imgUrl
        _postDescription = postDesc
    }
    
    init(key: String, dict: Dictionary<String, AnyObject>) {
        _postKey = key
        
        if let username = dict["userName"] as? String {
            _userName = username
        }
        
        if let imgUrl = dict["imageUrl"] as? String {
            _imageUrl = imgUrl
        }
        
        if let postDesc = dict["postDescription"] as? String {
            _postDescription = postDesc
        }
        
        if let likes = dict["Likes"] as? String {
            _likes = likes
        }
    }
    
    
    
    
}




