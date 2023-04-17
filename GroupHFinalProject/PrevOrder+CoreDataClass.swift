//
//  PrevOrder+CoreDataClass.swift
//  GroupHFinalProject
//
//  Created by Zachary on 2023-04-16.
//
//

import Foundation
import CoreData


public class PrevOrder: Identifiable {
    var prevOrders:Order
    var orderId:Int
    init(id:Int, prevOrders: Order) {
        self.prevOrders = prevOrders
        self.orderId = id
    }
}
