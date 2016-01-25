//
//  DataService.swift
//  pin-on
//
//  Created by 邱国邦 on 16/1/22.
//  Copyright © 2016年 FaceCat. All rights reserved.
//

import Foundation
import Firebase

let BASE_URL = "https://pin-on.firebaseio.com/"

class DataService {
    static let sharedDataSvc = DataService()
    
    private var _REF_BASE = Firebase(url: "\(BASE_URL)")
    private var _REF_USERS = Firebase(url: "\(BASE_URL)/users")
    private var _REF_POSTS = Firebase(url: "\(BASE_URL)/posts")
    
    var REF_BASE: Firebase {
        return _REF_BASE
    }
    
    var REF_USERS: Firebase {
        return _REF_USERS
    }
    
    var REF_POSTS: Firebase {
        return _REF_POSTS
    }
    
    func creatFirebaseUser(uid: String, user: Dictionary<String, String>) {
        _REF_USERS.childByAppendingPath(uid).setValue(user)
    }
}






