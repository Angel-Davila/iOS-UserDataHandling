//
//  User+CoreDataProperties.swift
//  iOS_firstDevelopment
//
//  Created by Edwin on 10/12/21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var userID: Int64
    @NSManaged public var userName: String?
    @NSManaged public var userPassword: String?
    @NSManaged public var userEmail: String?

}

extension User : Identifiable {

}
