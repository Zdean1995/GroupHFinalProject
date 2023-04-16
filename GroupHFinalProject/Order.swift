//
//  Order.swift
//  GroupHFinalProject
//
//  Created by Zachary on 2023-04-14.
//

import Foundation

class Order{
    var size: MenuItem
    var drink: MenuItem
    var side: MenuItem
    var toppings = [MenuItem]()
    
    init(size: MenuItem, drink: MenuItem, side: MenuItem, toppings: [MenuItem]) {
        self.size = size
        self.drink = drink
        self.side = side
        self.toppings = toppings
    }
    
    init(prevOrder: PrevOrder){
        self.size = MenuItem(coreString: prevOrder.size!)
        self.drink = MenuItem(coreString: prevOrder.drink!)
        self.side = MenuItem(coreString: prevOrder.side!)
        for topping in prevOrder.toppings!{
            self.toppings.append(MenuItem(coreString: topping))
        }
    }
    
    func calculateTotalPrice() -> Double {
        var toppingsPrice: Double = 0.0
        for topping in toppings {
            toppingsPrice += topping.price
        }
        
        return size.price + drink.price + side.price + toppingsPrice
    }
    
    func calculateTax() -> Double {
        return (calculateTotalPrice() * 0.13)
    }
    
    func calculateTotalPriceWithTax() -> Double {
        return calculateTotalPrice() + calculateTax()
    }
}
