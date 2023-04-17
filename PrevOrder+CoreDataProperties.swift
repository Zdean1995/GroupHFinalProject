//
//  PrevOrder+CoreDataProperties.swift
//  GroupHFinalProject
//
//  Created by Zachary on 2023-04-17.
//
//

import Foundation
import CoreData


extension PrevOrder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PrevOrder> {
        return NSFetchRequest<PrevOrder>(entityName: "PrevOrder")
    }

    @NSManaged public var size: String?
    @NSManaged public var toppings: String?
    @NSManaged public var price: String?
    @NSManaged public var delivery: Bool

}

extension PrevOrder : Identifiable {

}
