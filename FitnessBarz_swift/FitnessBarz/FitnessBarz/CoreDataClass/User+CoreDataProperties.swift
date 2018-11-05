//
//  User+CoreDataProperties.swift
//  FitnessBarz
//
//  Created by Charles on 2018/11/5.
//  Copyright © 2018年 Charles. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var account: String?
    @NSManaged public var name: String?
    @NSManaged public var id: Int32

}
