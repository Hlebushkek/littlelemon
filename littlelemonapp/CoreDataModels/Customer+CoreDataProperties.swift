//
//  Customer+CoreDataProperties.swift
//  littlelemonapp
//
//  Created by Hlib Sobolevskyi on 2024-07-05.
//
//

import Foundation
import CoreData


extension Customer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Customer> {
        return NSFetchRequest<Customer>(entityName: "Customer")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var email: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var toDish: Dish?

}

extension Customer : Identifiable {

}
