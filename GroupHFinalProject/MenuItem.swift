//
//  Size.swift
//  GroupHFinalProject
//
//  Created by Zachary on 2023-04-14.
//

import Foundation

class MenuItem:Identifiable {
    var name: String
    var price: Double
    
    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }
    
    init(coreString: String){
        let strings = coreString.split(separator: ",")
        self.name = String(strings[0])
        self.price = Double(strings[1])!
    }
    
    func toString() -> String {
        return name + "," + String(price)
    }
    
    public func createToppingsList() -> [MenuItem]{
        var toppings = [MenuItem]()
        toppings.append(MenuItem(name: "Pepperoni", price:0.0))
        toppings.append(MenuItem(name: "Mushroom", price:1.0))
        toppings.append(MenuItem(name: "Extra cheese", price:1.5))
        toppings.append(MenuItem(name: "Sausage", price:2.2))
        toppings.append(MenuItem(name: "Onion", price:0.8))
        return toppings
    }
    func createSizes() -> [MenuItem]{
        var toppings = [MenuItem]()
        toppings.append(MenuItem(name: "12 inch", price:0.0))
        toppings.append(MenuItem(name: "14 inch", price:1.0))
        toppings.append(MenuItem(name: "16 inch", price:1.5))
        toppings.append(MenuItem(name: "18 inch", price:2.0))
        toppings.append(MenuItem(name: "20 inch", price:2.5))
        return toppings
    }
    func createDrink() -> [MenuItem]{
        var toppings = [MenuItem]()
        toppings.append(MenuItem(name: "Coke", price:2.5))
        toppings.append(MenuItem(name: "Nestea", price:2.5))
        toppings.append(MenuItem(name: "Sprite", price:2.5))
        toppings.append(MenuItem(name: "Redbull", price:5.8))
        toppings.append(MenuItem(name: "Bottled Woter", price:3.5))
        return toppings
    }
    public  func createSide() -> [MenuItem]{
        var toppings = [MenuItem]()
        toppings.append(MenuItem(name: "Garlic", price:2.0))
        toppings.append(MenuItem(name: "Sour Cream", price:2.5))
        toppings.append(MenuItem(name: "Fries", price:7.4))
        toppings.append(MenuItem(name: "Chicken Breast", price:7.2))
        toppings.append(MenuItem(name: "Salad", price:8.5))
        return toppings
    }
}
extension MenuItem {
    static let toppingList = [
        MenuItem(name: "Pepperoni", price:0.0),
        MenuItem(name: "Mushroom", price:1.0),
        MenuItem(name: "Extra cheese", price:1.5),
        MenuItem(name: "Sausage", price:2.2),
        MenuItem(name: "Onion", price:0.8)
    ]
    static let sizeList = [
        MenuItem(name: "12 inch", price:0.0),
        MenuItem(name: "14 inch", price:1.0),
        MenuItem(name: "16 inch", price:1.5),
        MenuItem(name: "18 inch", price:2.0),
        MenuItem(name: "20 inch", price:2.5)
    ]
   static let drinkList = [
       MenuItem(name: "Coke", price:2.5),
       MenuItem(name: "Nestea", price:2.5),
       MenuItem(name: "Sprite", price:2.5),
       MenuItem(name: "Redbull", price:5.8),
       MenuItem(name: "Bottled Woter", price:3.5)
   ]
   static let sideList = [
        MenuItem(name: "Garlic", price:2.0),
        MenuItem(name: "Sour Cream", price:2.5),
        MenuItem(name: "Fries", price:7.4),
        MenuItem(name: "Chicken Breast", price:7.2),
        MenuItem(name: "Salad", price:8.5)
   ]
    
}
