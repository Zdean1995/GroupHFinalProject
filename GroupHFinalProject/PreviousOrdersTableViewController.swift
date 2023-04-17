//
//  PreviousOrdersTableViewController.swift
//  GroupHFinalProject
//
//  Created by Zachary on 2023-04-16.
//

import UIKit
import CoreData

class PreviousOrdersTableViewController: UITableViewController {

    @IBOutlet weak var testLabel: UILabel!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var viewController:ViewController!
    var defualtText: String = "Default"
    var prevOrders = [PrevOrder]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            prevOrders = try context.fetch(PrevOrder.fetchRequest())
        }
        catch {
            
        }
        
        testLabel.text = String(prevOrders.count)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
      
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return prevOrders.count
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destVC = segue.destination as! ViewController
//        destVC.orders = orders
//    }
   

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "prevCell", for: indexPath) as! PrevOrderCell
        let prevOrder = prevOrders[indexPath.row]

        cell.pizzaLabel.text = prevOrder.size! + " Pizza"
        cell.toppinsLabel.text = prevOrder.toppings
        cell.deliveryLabel.text = prevOrder.delivery ? "Delivery" : "Pick Up"
        cell.priceLabel.text = "Total Price: " + prevOrder.price!
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deletePrevOrder(prevOrder: prevOrders[indexPath.row])
            prevOrders.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    func deletePrevOrder(prevOrder: PrevOrder){
        context.delete(prevOrder)
        do {
            try context.save()
        }
        catch {
            
        }
    }

}
