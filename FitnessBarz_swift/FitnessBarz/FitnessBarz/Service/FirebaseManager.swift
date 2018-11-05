//
//  FirebaseManager.swift
//  FitnessBarz
//
//  Created by Charles on 2018/8/29.
//  Copyright © 2018年 Charles. All rights reserved.
//

import UIKit

class FirebaseManager: NSObject {
    static let shared: FirebaseManager = {
        let singleton = FirebaseManager()
        
        return singleton
    }()
}
