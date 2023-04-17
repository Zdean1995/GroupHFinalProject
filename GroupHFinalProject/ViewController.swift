//
//  ViewController.swift
//  GroupHFinalProject
//
//  Created by Zachary on 2023-03-22.
//

import UIKit



class ViewController: UIViewController {
    var orders = [PrevOrder] ()
    var defualtText: String = "Default"
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
      
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("View Controller \(orders.count)")
    }

    @IBAction func navigateNewOrder(_ sender: UIButton) {
        // Using storyboard
//        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "NewOrderViewController") as! NewOrderViewController
//        self.navigationController?.pushViewController(storyboard, animated:true)
        
        
        
        // Using Segue
        self.performSegue(withIdentifier: "newOrder", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC=segue.destination as? NewOrderViewController
        destinationVC?.viewController = self
        
        let destinationPVC=segue.destination as? PreviousOrdersTableViewController
        destinationPVC?.viewController = self
        
    }
    
    @IBAction func unwindToViewController(_ unwindSegue: UIStoryboardSegue) {
        
        // Use data from the view controller which initiated the unwind segue
    }
    @IBAction func unwindToViewPreviousTableViewController(_ unwindSegue: UIStoryboardSegue) {
        
        // Use data from the view controller which initiated the unwind segue
    }
    
    
    @IBAction func navigatePrevOrders(_ sender: UIButton) {
        self.performSegue(withIdentifier: "prevOrders", sender: self)
    }
}


