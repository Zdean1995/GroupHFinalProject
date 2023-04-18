//
//  PreviousOrdersTableViewController.swift
//  GroupHFinalProject
//
//  Created by Zachary on 2023-04-16.
//

import UIKit
import CoreData

class PreviousOrdersTableViewController: UITableViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var defualtText: String = "Default"
    var prevOrders = [PrevOrder]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            //loading the previous orders from the core data
            prevOrders = try context.fetch(PrevOrder.fetchRequest())
        }
        catch {
            
        }
      
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows
        return prevOrders.count
    }
   

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "prevCell", for: indexPath) as! PrevOrderCell
        let prevOrder = prevOrders[indexPath.row]

        cell.pizzaLabel.text = prevOrder.size! + " Pizza"
        cell.toppinsLabel.text = prevOrder.toppings
        cell.deliveryLabel.text = prevOrder.delivery ? "Delivery" : "Pick Up"
        cell.priceLabel.text = "Total Price: " + prevOrder.price!
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deletePrevOrder(prevOrder: prevOrders[indexPath.row])
            prevOrders.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        switch segue.identifier{
            case "edit":
                let dst=segue.destination as! NewOrderViewController
                let indexPath=tableView.indexPathForSelectedRow!
                let index=indexPath.row
                let order=prevOrders[index]
                dst.prevOrder=order
                dst.editMode=true
            default:
            preconditionFailure("unidentified segue ID: \(String(describing: segue.identifier))")
            
        }
    }
    
    //the function used for deleting an order from the core data
    func deletePrevOrder(prevOrder: PrevOrder){
        context.delete(prevOrder)
        do {
            try context.save()
        }
        catch {
            
        }
    }

}
