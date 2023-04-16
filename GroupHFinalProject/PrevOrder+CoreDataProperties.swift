//
//  PrevOrder+CoreDataProperties.swift
//  GroupHFinalProject
//
//  Created by Zachary on 2023-04-16.
//
//

import Foundation
import CoreData


extension PrevOrder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PrevOrder> {
        return NSFetchRequest<PrevOrder>(entityName: "PrevOrder")
    }

    @NSManaged public var size: String?
    @NSManaged public var drink: String?
    @NSManaged public var side: String?
    @NSManaged public var toppings: [String]?

}

extension PrevOrder : Identifiable {

}