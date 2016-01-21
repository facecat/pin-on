//
//  DataService.swift
//  pin-on
//
//  Created by 邱国邦 on 16/1/22.
//  Copyright © 2016年 FaceCat. All rights reserved.
//

import Foundation
import Firebase

class DataService {
    static let sharedDataSvc = DataService()
    
    private var _REF_BASE = Firebase(url: "https://pin-on.firebaseio.com/")
    
    var REF_BASE: Firebase {
        return _REF_BASE
    }
    
    
}