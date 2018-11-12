//
//  FirebaseManager.swift
//  FitnessBarz
//
//  Created by Charles on 2018/8/29.
//  Copyright © 2018年 Charles. All rights reserved.
//

import UIKit
import Firebase

class FirebaseManager: NSObject {
    let ref : DatabaseReference!
    static let shared: FirebaseManager = {
        let singleton = FirebaseManager()
        
        return singleton
    }()
    
    override init() {
        ref = Database.database().reference()
    }
    
    func writeData(json:Dictionary<String, Any>) {
        
    }
    
}
