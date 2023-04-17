//
//  Order.swift
//  GroupHFinalProject
//
//  Created by Zachary on 2023-04-14.
//

import Foundation

class Order:Identifiable{
    var size: String
    var toppings: String
    var delivery: Bool
    

    init(size: String, toppings: String, delivery: Bool) {
        self.size = size
        self.toppings = toppings
        self.delivery = delivery
    }
    

    func calculateTotalPrice() -> Double {
        var price = 0.0

        switch size{
        case "Large" : price += 15.00
        case "Medium": price += 12.0
        case "Small": price += 10.0
        default: price += 0.0
        }

        if(delivery){
            price += 3.0
        }

        return price
    }

    func calculateTax() -> Double {
        return (calculateTotalPrice() * 0.13)
    }

    func calculateTotalPriceWithTax() -> Double {
        return calculateTotalPrice() + calculateTax()
    }
}
